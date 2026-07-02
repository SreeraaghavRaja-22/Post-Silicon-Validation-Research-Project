#ifndef __CPU_MINOR_FETCH2_HH__
#define __CPU_MINOR_FETCH2_HH__

#include <vector>

#include "base/named.hh"
#include "cpu/minor/buffers.hh"
#include "cpu/minor/cpu.hh"
#include "cpu/minor/pipe_data.hh"
#include "cpu/pred/bpred_unit.hh"
#include "params/BaseMinorCPU.hh"

namespace gem5
{

namespace minor
{

/** This stage receives lines of data from Fetch1, separates them into
 *  instructions and passes them to Decode */
class Fetch2 : public Named
{
  protected:
    /** Input port carrying lines from Fetch1 */
    Latch<ForwardLineData>::Output inp; 

    /** Input port carrying branches from Execute. This is a snoop of the 
     *  data provided to F1 */ 
    /* Snoop just ensures that data is correct and synchronizes the 
     * different stages */
    Latch<BranchData>::Output branchInp;

    /** Output port carrying predictions back to Fetch1 */
    Latch<BranchData>::Input predictionOut;

    /** Output port carrying instructions back into Decode */
    Latch<ForwardInstData>::Input out; 

    /** Interface to reserve space in the next stage */
    std::vector<InputBuffer<ForwardInstData>> &nextStageReserve;
    
    /** Branch predictor passed from Python configuration */
    branch_prediction::BPredUnit &branchPredictor;

  public: 
    /** Public so that Pipeline can pass it to Fetch1 */
    std::vector<InputBuffer<ForwardLineData>> inputBuffer;
  protected:
    /** Data members after this line are cycle-to-cycle state */

    struct Fetch2ThreadInfo
    {
        Fetch2ThreadInfo() {}

        Fetch2ThreadInfo(const Fetch2ThreadInfo& other) :
            inputIndex(other.inputIndex),
            havePC(other.havePC),
            lastStreamSeqNum(other.lastStreamSeqNum),
            expectedStreamSeqNum(other.expectedStreamSeqNum),
            predictionSeqNum(other.predictionSeqNum),
            blocked(other.blocked)
        {
            set(pc, other.pc);
        }

        /** Index into an incompletely processed input line that instructions
         *  are to be extracted from */
        unsigned int inputIndex = 0;


        /** Remembered program counter value.  Between contiguous lines, this
         *  is just updated with advancePC.  For lines following changes of
         *  stream, a new PC must be loaded and havePC be set.
         *  havePC is needed to accomodate instructions which span across
         *  lines meaning that Fetch2 and the decoder need to remember a PC
         *  value and a partially-offered instruction from the previous line */
        std::unique_ptr<PCStateBase> pc;

        /** PC is currently valid.  Initially false, gets set to true when a
         *  change-of-stream line is received and false again when lines are
         *  discarded for any reason */
        bool havePC = false;

        /** Stream sequence number of the last seen line used to identify
         *  changes of instruction stream */
        InstSeqNum lastStreamSeqNum = InstId::firstStreamSeqNum;

        /** Fetch2 is the source of fetch sequence numbers.  These represent the
         *  sequence that instructions were extracted from fetched lines. */
        InstSeqNum fetchSeqNum = InstId::firstFetchSeqNum;

        /** Stream sequence number remembered from last time the
         *  predictionSeqNum changed.  Lines should only be discarded when their
         *  predictionSeqNums disagree with Fetch2::predictionSeqNum *and* they
         *  are from the same stream that bore that prediction number */
        InstSeqNum expectedStreamSeqNum = InstId::firstStreamSeqNum;

        /** Fetch2 is the source of prediction sequence numbers.  These
         *  represent predicted changes of control flow sources from branch
         *  prediction in Fetch2. */
        InstSeqNum predictionSeqNum = InstId::firstPredictionSeqNum;

        /** Blocked indication for report */
        bool blocked = false;
    };

    std::vector<Fetch2ThreadInfo> fetchInfo;
    
  public:
    /** Pass an input/buffer data to the output if you can */ 
    void evaluate(); 
}
}
}
