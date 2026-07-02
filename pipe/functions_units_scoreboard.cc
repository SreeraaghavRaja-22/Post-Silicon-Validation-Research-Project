// Contains code regarding Function Units and Scoreboard

// Here QueueInst is just a wrapper around MinorDynInst
typedef SelfStallingPipeline<QueuedInst, ReportTraitAdaptor<QueuedInst>> FUPipelineBase;

class FUPipeline : public FUPipelineBase, public FuncUnit {
	LaneFU &description;
	std::bitset<Num_OpClasses> capabilityList;
	
};

class LaneFU : public SimObject {
	Cycles oplat; // latency
	Cycles issueLat; // Delay after issuing an operation before next is issued.
			 // normally 1 due to pipelining, but for divide unit as it 
			 // is not pipelined it is > 1
	std::vector<LaneFUTiming *> timings;
};

class LaneFUTiming : public SimObject {
	Cycles extraCommitLat;
	Cycles extraAssumedLat; // extra delay to show in scoreboard after inst
				// leaving the pipeline. Normally 0 but for mult it 
				// is 2
	/* for each of this instruction's source registers (in srcRegs
	 * order). The offsets are subtracted from scoreboard returnCycle times.
	 * For example, for an instruction type with 3 source registers, 
	 * [2, 1, 2[ will allow the instruction to issue up to 2 cycles early
	 * for dependencies on the 1st and 3rd register and up to 1 cycle early on the 2nd */
	
	// if the list has a single number then the latencies are the same
	// Ex: LaneDefaultIntFU is [2] and LaneDefaultIntMulFU is [0], the 
	// latancies of all the registers are 2 for the first and 0 for the 
	// second
	std::vector<Cycles> srcRegsRelativeLats;
};

class Scoreboard : public Named {
	std::vector<int> fuIndices;

	// number of results which are not predicatable (memory loads in general)
	std::vector<Index> numUnpredictableResults;

	// estimated cycle number that the result will be presented.
	std::vector<Cycles> returnCycle

};

// Called before issuing an instruction
void Scoreboard::markupInstDests(Cycles retire_time, bool mark_unpredicatable){
	for(dest_index = 0; dest_index < num_dests; dest_index++;){
		reg = flattenRegIndex(staticInst->destRegIdx(dest_index));
		numResults[reg]++;
		if(mark_unpredictable)
			numUnpredictableResults[reg]++;
		returnCycle[reg] = retire_time; // retire_time is curCycle() + inst->fu->opLat;
		fuIndices[reg] = inst -> fuIndex; // save the function unit id for this dest reg
	}
}

bool Scoreboard::canInstIssue(std::vector<Cycles> *src_reg_relative_latencies, std::vector<bool> *cant_forward_from_fu_indices){
	for(src_index = 0; src_index < inst->numSrcRegs(); src_index++){
		reg = flattenRegIndex(staticInst -> srcRegIdx(src_index));

		// get the relative latency based on the current source index
		Cycles relative_latency = src_index >= src_reg_relative_latencies -> size()-1 ? src_reg_relative_latencies->back() // last element
					  : *(src_reg_relative_latencies)[src_index];
		// if a previously issued instruction will write back to this register after
		// the current instruction completes, block issue to maintain in-order completion
		if(returnCycle[reg] > curCycle() + relativeLatency)
			return false;
	}
	return true;
}

/* Clears the destination registers of a completed or squashed instruction
 * from the scoreboard, releasting dependencies for tracking upstream stages.
 */
bool Scoreboard::clearInstDests(inst, bool clear_unpredictable){
	// Loop through every destination register that this instruction was scheduled to write to	
	for(dest_index = 0; dest_index < num_dests; dest_index++){
		// Look up and flatten the physical/architectural register index for this specific destination
		RegIndex reg = inst -> flatDestRegIdx[dest_index];
		
		// If specified (e.g. on a branch misprediction or recovery path),
		// decrement the count of speculative/unpredictable in-flight results targeting
		// this register
		if(clear_unpredictable)
			numUnpredictableResults[reg]--;
		// decrement total number of outstanding in-flight instructions writing to this register.
		// once this hits 0, this register is no longer "busy" or hazardous 
		numResults[reg]--;
		
		// if no more pending instructions are wriiting to this register, 
		// safely wipe its scoreboard tracking slot entirely.
		if(numResults[reg] == 0){
			// reset the calculated clock cycle when this register will become valid to 0
			returnCycle[reg] = Cycles(0);
			// Clear the pointer reference to the instruction that was writing to it
			writingInst[reg] = 0;
			// Clear the functional unit index mapping (-1 means that no FU is current producing this register)
			fuIndices[reg] = -1;
		}
	}

}
