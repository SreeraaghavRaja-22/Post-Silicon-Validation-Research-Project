#ifndef __CPU_MINOR_EXECUTE_HH__
#define __CPU_MINOR_EXECUTE_HH__

#include <vector>

#include "base/named.hh"
#include "base/types.hh"
#include "cpu/minor/buffers.hh"
#include "cpu/minor/cpu.hh"
#include "cpu/minor/func_unit.hh"
#include "cpu/minor/lsq.hh"
#include "cpu/minor/pipe_data.hh"
#include "cpu/minor/scoreboard.hh"

namespace gem5
{

namespace minor
{

/** Execute stage.  Everything apart from fetching and decoding instructions.
 *  The LSQ lives here too. */
class Execute : public Named
{
  protected: 
    
    /** Input port carrying instructions from Decode */
    Latch<ForwardInstData>::Output inp; // connected to dToE Latch
    
    /** Input port carrying stream changes to Fetch1 */
    Latch<BranchData>::Input out;

    /** Scoreboard of instruction dependencies */
    std::vector<Scoreboard> scoreboard;
 
    /** The execution of functional units */
    std::vector<FUPipeline *> funcUnits;

  public: 
    /* Public for Pipeline to be able to pass it to Decode */
    std::vector<InputBuffer<ForwardInstData>> inputBuffer;
}
}
}
