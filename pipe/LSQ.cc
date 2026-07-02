// Contains all the functions that are important for the Load/Store Queue (LSQ)

LSQ::step(){
	tryToSendToTransfers(requests.front());
	storeBuffer.step();
}

LSQ::tryToSendToTransfers(LSQRequest* request){
	// note that LSQRequest is not a type of Request but a 
	// derived classe from BaseTLB::Translation and Packet::SenderState
	LSQRequest request = requests.front();

	if(request->isComplete()){
		// LSQ::moveFromRequestsToTransfers(LSQRequestPtr request)
		requests.pop();
		transfers.push(request);
	}

	if(!(request->isLoad && storeBuffer.canForwardData())){
		if(tryToSend(request)){
			requests.pop();
			transfers.push(request);
		}
	}
}

LSQ::tryToSend(LSQRequest* request){
	dcachePort.sendTimingRequest(request->packet);
	//Set the state of the request appropriately depending on success or failure
}

LSQ::recvTimingResp(Packet* response){
	// the packet for memory requests contains LSQRequest pointers (can think of as ids associated
	// with each request that has been sent so far). These LSQRequests are stored in the transfers
	// queue. When a memory response is received the corresponding entry is searched for in the 
	// transfers queue and its status is set to complete. In real hardware this process should be 
	// to search for the corresponding id location and then flip the status bit. 
	// Search in a queue can be done using CAM based approach
	response->popSenderState()->setStatus(complete);
}

LSQ::StoreBuffer::step(){
	LSQRequest** i = slots.begin();
	while(issued && issue_count < StoreLimit && i!=slots.end()){
		LSQRequest* request = *i;
		lsq.tryToSend(request);
	}
}


LSQ::pushRequest(){
	if(!isLoad)
		request_data = new uint8_t[size];
	LSQrequest* request = new SingleDataRequest();
	request->request.setContext();
	request->request.setVirt();
	requests.push(request);
	// request->setAddrTranslation();
	thread->getDTBPtr()->translateTiming(request->request);
	// TranslateTiming calls the finish() method when done with translation
}

LSQ::SingleDataRequest::finish(){
	// packet = makePacketForRequest(request, data);
	Packet* packet = isLoad ? Packet::createRead(&request) : Packet::createWrite(&request);
	packet->pushSenderState(this);
	if(isLoad) packet -> allocate();
	else       packet -> dataDynamic(data);

	data = NULL;
}

