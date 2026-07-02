/** This file shows all the functions in the execute stage of pipeline **/

void
Execute::evaluate()
{
	// Set the dToE Latch data as the one to be pushed into input buffer next
	inputBuffer[inp.outputWire->threadId].setTail(*inp.outputWire);

	lsq.step(); // Step the Load-Store Queues
	commit();   // Commit the instruction
	issue();    // Issue instructions whose dependencies are satisfied 
	
	// Push the dToE Latch data into the input buffer
	inputBuffer[inp.outputWire->threadId].pushTail();	
}


/** Commit takes an inst out from the head of the inflight inst queue and
 * depending upon whether out-of-order memory requests are supported or not
 * it commits the instruction, clears its destination entry from scoreboard
 * and removes it from the head of the inflight insts
 */
void 
Execute::commit(){
	// While issue() has already issued some instructions into the FUs
	while(executeInfo[tid].inFlightInsts->empty() && num_insts_committed != commitLimit){
		head_inflight_inst = executeInfo[tid].inFlightInsts.front();
		inst = head_inflight_inst->inst; 
		mem_response = ( head_inflight_inst->inst->inLSQ ) ? lsq.findResponse() : NULL;

		if(mem_response)
			handleMemResponse(inst, mem_response, ...);
		else{
			// If there is a load/store inflight try to commit it before the head of 
			// the inflight inst
			if(!executeInfo[tid].inFUMemInsts->empty() && lsq.canRequest()) {
				fun_inst = executeInfo.inFUMemInsts.front().inst;
				fu = funcUnits[ fun_inst -> fuIndex ];
				if(!fu_inst -> inLSQ && fu_inst -> canEarlyIssue )
				{
					try_to_commit = true; 
					inst = fu_inst;
				}
			}

			// At this point depending on whether we are doing an early
			// issue of mem request or actually handling the head of the
			// inflight inst. inst will be pointing to the corresponding
			// inst
			if(!completed_inst && !inst->inLSQ)
			{
				fu_inst = funcUnits[inst->fuIndex]->front();
				if(fu_inst.inst->id == inst->id){
					try_to_commit = true; 
					completed_inst = true;
				}
			}

			if(try_to_commit)
			{
				// If there is a stream sequence mismatch i.e. inst is a post
				// branch inst, then discard the inst
				discard_inst = inst-> id.streamSeqNum != executeInfo[tid].streamSeqNum;
				if(!discard_inst)
					completed_inst = commitInst(...);
			}
			if(completed_inst)
			{
				funcUnits[inst->fuIndex]->stalled = false;
				executeInfo[tid].inFlightInsts->pop();
				scoreboard[tid].clearInstDests(inst);
			}
		}

	}
}

LSQ::findResponse(inst){
	if(!transfers.empty()){
		LSQRequest* req = transfers.front();
		if((req->inst->id == inst->id) && // same instruction
		(req -> isComplete()) { 
			return req;
		}
	}

	return NULL;
}

Execute::handleMemResponse(inst, LSQRequest mem_response, ...){
	inst -> staticInst -> completeAcc(...);
	lsq.popResponse();
	...
}

LSQ::popResponse(...){
	transfers.pop();
}


void 
Execute::commitInst (inst, branch)
{
	if(inst->isMemRef()) // load/store instruction 
	{
		inst -> staticInst -> initiateAcc(); // this will eventually push inst on LSQ's request queue
		completed_inst = true;
	}
	else // other arithmetic instructions
	{
		// Execute the instruction and write the result in register file
		// If the instruction is a branch instruction it updates the thread._pcState
		inst -> staticInst -> execute();

		target = thread->pcState();
		pc_before = inst->pc;
		if (inst -> predictedTaken){
			if(inst -> predictedTarget == target )
				// update the branch variable for correct prediction
			else
				// update for wrong prediction
		}
	}
}

/** Takes a set of instructions out of the inputBuffer. If the dependencies
 * are satisfied keeps issuing the instructions by pushing them to FU and
 * marking the dests in scoreboard. It stops and removes the instruction 
 * from the inputBuffer in case all the insts in Latch are sent to the FUs. It
 * also stops in the case all the insts in Latch are sent to the FUs. It
 * also stops in the case when any of the inst is dependent on some previous
 * inst. In this case any of insts after that are also not scheduled
 */
void
Execute::issue(inst)
{
	inst_in = inputBuffer[tid].front();

	do{
		issued = false;
		inst = insts_in -> insts[thread.inputIndex];
		for (fu_idx = 0; fu_idx < numFuncUnits; fu_idx++){
			fu = funcUnits[fu_idx];
			if(!fu->stalled && fu->provides(inst)){
			// Check the scoreboard to see if the inst depends on previous insts
				if(scoreboard.canInstIssue(inst)){
					fu->push(inst);
					// Mark the destination regs in scoreboard
					scoreBoard.markupInstDest(inst);
					executeInfo[tid].inFlightInsts.push(inst);
					issued = true;
				}
			}
		}

		if(executeInfo[tid].inputIndex == insts_int=>width()){
			inputBuffer[tid].pop();
			inst_in = NULL;
		}
	}while(inst_in && issued);
}

void
fetch2::evaluate(){
	// Mark the data to the f1ToF2 Latch() as one to be
	// pushed to the inputBuffer next
	inputBuffer[tid].setTail(*inp.OutputWire); // f1ToF2
	
	ForwardInstData &insts_out = *out.inputWire; // f2ToD
	BranchData &branch_inp = *branchInpt.outputWire; // eToF1
	
	// React to branches from execute stage to update local branch
	// prediction structures (update the branch predictor itself)
	updateBranchPrediction(branch_inp);

	// thread will be blocked if no space in decode's inputBuffer
	fetchInfo[tid].blocked = !nextStageReserve[tid].canReserve();

	if (fetchInfo[tid].expectedStreamSeqNum == inputBuffer[tid].front()->id.streamSeqNum 
	&& fetchInfp[tid].predictionSeqNum != inputBuffer[tid].front()->id.predictionSeqNum){
		inputBuffer[tid].pop();
		line_in = inputBuffer[tid].front();
	}

	// Discard the instructions for which Fetch2 predicted sequence number is
	// different from the one with fetch1 fetched these instructions i.e. discard
	// the instructions which are fetched not complying to branch pred decision in
	// fetch2
	if(line_in && fetchInfo[tid].expectedStreamSeqNum == line-in -> id.streamSeqNum
	&& fetchInfo[tid].predictionSeqNum != line_in -> id.predictionSeqNum){
		inputBuffer.pop();
	}

	// fetch1 sends an entire cache line to fetch2 and no just a single inst
	// fetch2 depending on what output width decodes that many insts. 
	// This decoding in hardware can be done using multiple decoders or a 
	// single time-multiplexed decoder
	while(line_in && fetchInfo[tid].inputIndex < line_in -> lineWidth &&
	outputIndex < outputWidth)
	{
		fetchInfo.pc = line_in -> pc;
		dyn_inst = new MinorDynInst(line_in -> id);
		// decode the instruction
		decoded_inst = decoder->decode(fetchInfo[tid].pc);
		// Advance the PC
		TheISA::advancePC(fetchInfo[tid].pc, decoded_inst);
		// Calls branchPredictor.predict() if the inst is a Control inst
		// and updates the prediction variable for new stream and prediction
		// sequence number
		predictBranch(dyn_inst, prediction);
		insts_out.insts[output_index++] = dyn_inst;
		if(!prediction.isBubble())
			line_in = NULL;
		else if(fetchInfp[tid].inputIndex == line_in -> lineWidth)
			inputBuffer[tid].pop();	

	}
	if(!inst_out.isBubble())
		nextStageReserve[tid].reserve();
	if(!inp.outputWire->isBubble)
		inputBuffer[inp.outputWire->id.threadId].pushTail();
}


void
fetch1::evaluate()
{
	BranchData &execute_branch = *inp.outputWire; // eToF1
	BranchData &fetch2_branch = * prediction.outputWire; //f2ToF1
	ForwardLineData &line_out = *out.inputWire; // f1ToF2
	fetchInfo[tid].blocked = !nextStageReserve[tid].canReserve();

	// Prioritize the branch stream change of execute over fetch2
	if(execute_branch.isStreamChange())
	{
		// updates the fetchInfo[tid].pc to branch target. updates the
		// stream sequence number and prediction sequence number 
		// in fetchInfo[tid]
		changeStream(execute_branch);
	}	
	else if(fetch2_branch.isStreamChange())
	{
		changeStream(fetch2_branch);
	}

	// Pushes the fetch memory request to the request quue, reseves a slot
	// for it in the transfers queue and does an ITLB access. It also 
	// updates the PC by +4 (as no branch predictor in fetch1)
	fetchLine(tid);

	nextStageReserve.reserve();

	// If the ICache is not busy, it tries to sed fetch request to ICache
	// if successful it moves the request from request queue to transfers queue.
	stepQueues();

	// The head of the transfers queue is a completed fetch request
	if(!transfers.empty() && transfer.front()->isComplete()){
		line_out.pc = transfers.front().pc;
		line_out.line = transfers.front()->data;
		popAndDiscard(transfers);
	}
}
