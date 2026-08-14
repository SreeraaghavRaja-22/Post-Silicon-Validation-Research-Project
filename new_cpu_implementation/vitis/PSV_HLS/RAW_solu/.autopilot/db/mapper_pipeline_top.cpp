#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" void pipeline_top(char, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);
extern "C" void apatb_pipeline_top_hw(char __xlx_apatb_param_reset, volatile void * __xlx_apatb_param_stall_out, volatile void * __xlx_apatb_param_forward_A_sel_out, volatile void * __xlx_apatb_param_forward_B_sel_out, volatile void * __xlx_apatb_param_hazard_dest_out, volatile void * __xlx_apatb_param_pc_out) {
  // DUT call
  pipeline_top(__xlx_apatb_param_reset, __xlx_apatb_param_stall_out, __xlx_apatb_param_forward_A_sel_out, __xlx_apatb_param_forward_B_sel_out, __xlx_apatb_param_hazard_dest_out, __xlx_apatb_param_pc_out);
}
