class BaseCache {
	// internal data structures
	MSHRQueue mshrQueue;
	WriteQueue writeBuffer;

	// parameters
	int blkSize;
	Cycles lookupLatency
	Cycles dataLatency;
	Cycles forwardLatency;
	Cycles fillLatency;
	Cycles responseLatency;
	int numTargets;
};

class Cache : public BaseCache {
	// internal data structures
	BaseTags *tags;
	BasePrefetcher *prefetcher;
};

class BaseTags {
	int blkSize; // cache line size
		     // since cache line size should be the same 
		     // for all cache levels, blkSize is a 
		     // property of the "system" and not just
		     // a cache. Hence, this is set in config by 
		     // "system.cache_line_size = .." and
		     // Tags.py copies that parameter into blkSize
		     // variable
	int size;    // size of cache
	...
};

/* There are many types of tag stores derived from BaseTags
 * BaseTags -> BaseSetAssoc -------> LRU
 * (set associative |---> RandomRep1 caches)
 * BaseTags -> FALRU -> (fully associative LRU) 
 */

class BaseSetAssoc : public BaseTags {
	// data structures
	CacheSet<CacheBlk>* sets; // cache sets
	CacheBlk* blks; 	  // cache blocks
	uint8_t* dataBlks;	  // data blocks (1 per cache block)
	
	// parameters
	int assoc; // associativity
	int numSets;
};

class CacheBlk {
	enum CacheBlkStatusBits {..., BlkDirty, ...};

	Addr tag;      // data block tag value
	uint8_t* data; // contains copy of data for easy access
	int set, way;  // set and way this block belongs to
};

template <class BlkType>
class CacheSet {
	int assoc; 	// associativity of this set
	BlkType **blks; // cache blocks in this set
};

Cache::recvTimingReq(){
	CacheBlk* blk = NULL;
	std::list<PacketPtr> writebacks; 
	bool satisfied = access(pkt, blk, writebacks);
	doWritebacks(writebacks);
	if(statisfied) {
		if(pkt->needsResponse()){
			pkt->makeTimingResponse();
			cpuSidePort->schedTimingResp(pkt, request_time);
		}
	}
}

Cache::access(pkt, blk, writebacks){
	blk = tag->accessBlock(pkt);
}

LRU::accessBlock(pkt, is_secure, &lat) {
	// LRU class is derived from BaseSetAssoc class
	CacheBlk* blk = BaseSetAssoc::accessBlock(pkt->getAddr(), is_secure, &lat);
	// move this block to head of MRU
	sets[blk->set].moveToHead(blk);
	return blk;
}

BaseSetAssoc::accessBlock(addr, is_secure, &lat){
	Addr tag = extractTag(addr);
	int set = extractSet(addr);
	blk = sets[set].findBlk(tag);
	lat = accessLatency;
}

template <class BlkType>
	CacheSet<BlkType>::findBlk(tag, is_secure) {
	for(int i = 0; i < assoc; ++i){
		if(blks[i]->tag == tag && blks[i]->isValid() && blks[i]->isSecure() == is_secure){
			way_id = i; 
			return blks[i];
		}
	}
	return nullptr;
}
