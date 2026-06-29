#ifndef __CPU_MINOR_PIPELINE_HH__
#define __CPU_MINOR_PIPELINE_HH__

#include "cpu/minor/activity.hh"
#include "cpu/minor/cpu.hh"
#include "cpu/minor/decode.hh"
#include "cpu/minor/execute.hh"
#include "cpu/minor/fetch1.hh"
#include "cpu/minor/fetch2.hh"
#include "params/BaseMinorCPU.hh"
#include "sim/ticked_object.hh"

namespace gem5
{

GEM5_DEPRECATED_NAMESPACE(Minor, minor);
namespace minor
{


class Pipeline : public Ticked
{

	protected:
	    MinorCPU &cpu;

	    /* Allow cycles to be skipped when pipeline is idling */
            bool allow_idling
    
	    /* Latches to connect the stages */
	    Latch<ForwardLineData> f1ToF2
	    Latch<BranchData> f2ToF1;
	    Latch<FowardInstData> f2ToD;
	    Latch<ForwardInstData> dToE;
	    Latch<BranchData> eToF1;

	    /* Pipeline Stages */
	    Execute execute; 
	    Decode decode; 
	    Fetch2 fetch2;
	    Fetch1 fetch1;

	public:
	    /* Action to be performed at each cycle (tick) */
	    void evaluate();
}
}
}
#endif /* __CPU_MINOR_PIPELINE_HH__ */
