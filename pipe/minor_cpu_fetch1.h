#ifndef __CPU_MINOR_FETCH1_HH__
#define __CPU_MINOR_FETCH1_HH__

#include <vector>

#include "arch/generic/mmu.hh"
#include "base/named.hh"
#include "cpu/base.hh"
#include "cpu/minor/buffers.hh"
#include "cpu/minor/cpu.hh"
#include "cpu/minor/pipe_data.hh"
#include "mem/packet.hh"

namespace gem5
{

namespace minor
{
/** A stage responsible for fetching "lines" from memory and passing
 *  them to Fetch2 */
class Fetch1 : public Named
{
  protected:
    /** Input port carrying branch requests from Execute */
    Latch<BranchData>::Output inp;
    /** Output port carrying read lines to Fetch2 */
    Latch<ForwardLineData>::Input out;
    /** Input port carrying branch predictions from Fetch2 */
    Latch<BranchData>::Output prediction;

    /** Interface to reserve space in the next stage */
    std::vector<InputBuffer<ForwardLineData>> &nextStageReserve;

    /** IcachePort to pass to the CPU.  Fetch1 is the only module that uses
     *  it. */
    IcachePort icachePort;
 
    /** Queue of address translated requests from Fetch1 */
    FetchQueue requests;

    /** Queue of in-memory system requests and responses */
    FetchQueue transfers;

    /** Retry state of icache_port */
    IcacheState icacheState;

    /** Sequence number for line fetch used for ordering lines to flush */
    InstSeqNum lineSeqNum;

    std::vector<Fetch1ThreadInfo> fetchInfo;

  public:
    /** Pass on input/buffer data to the output if you can */
    void evaluate();
};
}
}
