#ifndef __CPU_MINOR_DECODE_HH__
#define __CPU_MINOR_DECODE_HH__

#include <vector>

#include "base/named.hh"
#include "cpu/minor/buffers.hh"
#include "cpu/minor/cpu.hh"
#include "cpu/minor/dyn_inst.hh"
#include "cpu/minor/pipe_data.hh"

namespace gem5
{

namespace minor
{

/* Decode takes instructions from Fetch2 and decomposes them into micro-ops
 * to feed to Execute.  It generates a new sequence number for each
 * instruction: execSeqNum.
 */
class Decode : public Named
{
  protected:
    /** Input port carrying macro instructions from Fetch2 */
    Latch<ForwardInstData>::Output inp; 
    /** Output pot carrying micro-op decomposed instructions to Execute */
    Latch<ForwardInstData>::Input out;

    /** Interface to reserve space in the next stage (execute) */
    std::vector<InputBuffer<ForwardInstData>> &nextStageReserve;

  public: 
    /** Public for pipeline to be able to pass it to Fetch2 */
    std::vector<InputBuffer<ForwardInstData>> inputBuffer;
  
  protected:
    /** Data members after this line are cycle-to-cycle state */

    struct DecodeThreadInfo
    {
        DecodeThreadInfo() {}

        DecodeThreadInfo(const DecodeThreadInfo& other) :
            inputIndex(other.inputIndex),
            inMacroop(other.inMacroop),
            execSeqNum(other.execSeqNum),
            blocked(other.blocked)
        {
            set(microopPC, other.microopPC);
        }


        /** Index into the inputBuffer's head marking the start of unhandled
         *  instructions */
        unsigned int inputIndex = 0;

        /** True when we're in the process of decomposing a micro-op and
         *  microopPC will be valid.  This is only the case when there isn't
         *  sufficient space in Executes input buffer to take the whole of a
         *  decomposed instruction and some of that instructions micro-ops must
         *  be generated in a later cycle */
        bool inMacroop = false;
        std::unique_ptr<PCStateBase> microopPC;

        /** Source of execSeqNums to number instructions. */
        InstSeqNum execSeqNum = InstId::firstExecSeqNum;

        /** Blocked indication for report */
        bool blocked = false;
    };

    std::vector<DecodeThreadInfo> decodeInfo;
   
  public:
    /** Pass on input/buffer data to the output if you can */
    void evaluate();
}
}
}
