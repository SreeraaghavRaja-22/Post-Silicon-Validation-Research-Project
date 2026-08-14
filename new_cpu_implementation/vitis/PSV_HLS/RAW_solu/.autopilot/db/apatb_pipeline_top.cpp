#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_reset "../tv/cdatafile/c.pipeline_top.autotvin_reset.dat"
#define AUTOTB_TVOUT_reset "../tv/cdatafile/c.pipeline_top.autotvout_reset.dat"
// wrapc file define:
#define AUTOTB_TVIN_stall_out "../tv/cdatafile/c.pipeline_top.autotvin_stall_out.dat"
#define AUTOTB_TVOUT_stall_out "../tv/cdatafile/c.pipeline_top.autotvout_stall_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_forward_A_sel_out "../tv/cdatafile/c.pipeline_top.autotvin_forward_A_sel_out.dat"
#define AUTOTB_TVOUT_forward_A_sel_out "../tv/cdatafile/c.pipeline_top.autotvout_forward_A_sel_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_forward_B_sel_out "../tv/cdatafile/c.pipeline_top.autotvin_forward_B_sel_out.dat"
#define AUTOTB_TVOUT_forward_B_sel_out "../tv/cdatafile/c.pipeline_top.autotvout_forward_B_sel_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_hazard_dest_out "../tv/cdatafile/c.pipeline_top.autotvin_hazard_dest_out.dat"
#define AUTOTB_TVOUT_hazard_dest_out "../tv/cdatafile/c.pipeline_top.autotvout_hazard_dest_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_pc_out "../tv/cdatafile/c.pipeline_top.autotvin_pc_out.dat"
#define AUTOTB_TVOUT_pc_out "../tv/cdatafile/c.pipeline_top.autotvout_pc_out.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_reset "../tv/rtldatafile/rtl.pipeline_top.autotvout_reset.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_stall_out "../tv/rtldatafile/rtl.pipeline_top.autotvout_stall_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_forward_A_sel_out "../tv/rtldatafile/rtl.pipeline_top.autotvout_forward_A_sel_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_forward_B_sel_out "../tv/rtldatafile/rtl.pipeline_top.autotvout_forward_B_sel_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_hazard_dest_out "../tv/rtldatafile/rtl.pipeline_top.autotvout_hazard_dest_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_pc_out "../tv/rtldatafile/rtl.pipeline_top.autotvout_pc_out.dat"


inline void rev_endian(char* p, size_t nbytes)
{
  std::reverse(p, p+nbytes);
}

template<size_t bit_width>
struct transaction {
  typedef uint64_t depth_t;
  static const size_t wbytes = (bit_width+7)>>3;
  static const size_t dbytes = sizeof(depth_t);
  const depth_t depth;
  const size_t vbytes;
  const size_t tbytes;
  char * const p;
  typedef char (*p_dat)[wbytes];
  p_dat vp;

  void reorder() {
    rev_endian(p, dbytes);
    p_dat vp = (p_dat) (p+dbytes);
    for (depth_t i = 0; i < depth; ++i) {
      rev_endian(vp[i], wbytes);
    }
  }

  transaction(depth_t depth)
    : depth(depth), vbytes(wbytes*depth), tbytes(dbytes+vbytes),
      p(new char[tbytes]) {
    *(depth_t*)p = depth;
    vp = (p_dat) (p+dbytes);
  }

  template<size_t psize>
  void import(char* param, depth_t num, int64_t offset) {
    param -= offset*psize;
    for (depth_t i = 0; i < num; ++i) {
      memcpy(vp[i], param, wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[i], wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num, int64_t skip) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[skip+i], wbytes);
      param += psize;
    }
  }

  ~transaction() { if (p) { delete[] p; } }
};
      

inline const std::string begin_str(int num)
{
  return std::string("[[transaction]] ")
         .append(std::to_string(num))
         .append("\n");
}

inline const std::string end_str()
{
  return std::string("[[/transaction]] \n");
}
      
class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  reset_depth = 0;
  stall_out_depth = 0;
  forward_A_sel_out_depth = 0;
  forward_B_sel_out_depth = 0;
  hazard_dest_out_depth = 0;
  pc_out_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{reset " << reset_depth << "}\n";
  total_list << "{stall_out " << stall_out_depth << "}\n";
  total_list << "{forward_A_sel_out " << forward_A_sel_out_depth << "}\n";
  total_list << "{forward_B_sel_out " << forward_B_sel_out_depth << "}\n";
  total_list << "{hazard_dest_out " << hazard_dest_out_depth << "}\n";
  total_list << "{pc_out " << pc_out_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int reset_depth;
    int stall_out_depth;
    int forward_A_sel_out_depth;
    int forward_B_sel_out_depth;
    int hazard_dest_out_depth;
    int pc_out_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static bool RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool err = false;
  size_t x_found;

  // search and replace 'X' with '0' from the 3rd char of token
  while ((x_found = AESL_token.find('X', 0)) != string::npos)
    err = true, AESL_token.replace(x_found, 1, "0");
  
  // search and replace 'x' with '0' from the 3rd char of token
  while ((x_found = AESL_token.find('x', 2)) != string::npos)
    err = true, AESL_token.replace(x_found, 1, "0");
  
  return err;}
extern "C" void pipeline_top_hw_stub_wrapper(char, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_pipeline_top_hw(char __xlx_apatb_param_reset, volatile void * __xlx_apatb_param_stall_out, volatile void * __xlx_apatb_param_forward_A_sel_out, volatile void * __xlx_apatb_param_forward_B_sel_out, volatile void * __xlx_apatb_param_hazard_dest_out, volatile void * __xlx_apatb_param_pc_out) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
static AESL_FILE_HANDLER aesl_fh;
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_stall_out);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<1> > stall_out_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "stall_out");
  
            // push token into output port buffer
            if (AESL_token != "") {
              stall_out_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "stall_out" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_stall_out)[0*1+0] = stall_out_pc_buffer[0].range(0, 0).to_uint64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_forward_A_sel_out);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > forward_A_sel_out_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "forward_A_sel_out");
  
            // push token into output port buffer
            if (AESL_token != "") {
              forward_A_sel_out_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "forward_A_sel_out" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_forward_A_sel_out)[0*4+0] = forward_A_sel_out_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_forward_A_sel_out)[0*4+1] = forward_A_sel_out_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_forward_A_sel_out)[0*4+2] = forward_A_sel_out_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_forward_A_sel_out)[0*4+3] = forward_A_sel_out_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_forward_B_sel_out);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > forward_B_sel_out_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "forward_B_sel_out");
  
            // push token into output port buffer
            if (AESL_token != "") {
              forward_B_sel_out_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "forward_B_sel_out" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_forward_B_sel_out)[0*4+0] = forward_B_sel_out_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_forward_B_sel_out)[0*4+1] = forward_B_sel_out_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_forward_B_sel_out)[0*4+2] = forward_B_sel_out_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_forward_B_sel_out)[0*4+3] = forward_B_sel_out_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_hazard_dest_out);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > hazard_dest_out_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "hazard_dest_out");
  
            // push token into output port buffer
            if (AESL_token != "") {
              hazard_dest_out_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "hazard_dest_out" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_hazard_dest_out)[0*4+0] = hazard_dest_out_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_hazard_dest_out)[0*4+1] = hazard_dest_out_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_hazard_dest_out)[0*4+2] = hazard_dest_out_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_hazard_dest_out)[0*4+3] = hazard_dest_out_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_pc_out);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > pc_out_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "pc_out");
  
            // push token into output port buffer
            if (AESL_token != "") {
              pc_out_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "pc_out" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_pc_out)[0*4+0] = pc_out_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_pc_out)[0*4+1] = pc_out_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_pc_out)[0*4+2] = pc_out_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_pc_out)[0*4+3] = pc_out_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
CodeState = DUMP_INPUTS;
// print reset Transactions
{
aesl_fh.write(AUTOTB_TVIN_reset, begin_str(AESL_transaction));
{
    sc_bv<1> __xlx_tmp_lv = *((char*)&__xlx_apatb_param_reset);
aesl_fh.write(AUTOTB_TVIN_reset, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.reset_depth);
aesl_fh.write(AUTOTB_TVIN_reset, end_str());
}

// print stall_out Transactions
{
aesl_fh.write(AUTOTB_TVIN_stall_out, begin_str(AESL_transaction));
{
    sc_bv<1> __xlx_tmp_lv = *((char*)__xlx_apatb_param_stall_out);
aesl_fh.write(AUTOTB_TVIN_stall_out, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.stall_out_depth);
aesl_fh.write(AUTOTB_TVIN_stall_out, end_str());
}

// print forward_A_sel_out Transactions
{
aesl_fh.write(AUTOTB_TVIN_forward_A_sel_out, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_forward_A_sel_out);
aesl_fh.write(AUTOTB_TVIN_forward_A_sel_out, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.forward_A_sel_out_depth);
aesl_fh.write(AUTOTB_TVIN_forward_A_sel_out, end_str());
}

// print forward_B_sel_out Transactions
{
aesl_fh.write(AUTOTB_TVIN_forward_B_sel_out, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_forward_B_sel_out);
aesl_fh.write(AUTOTB_TVIN_forward_B_sel_out, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.forward_B_sel_out_depth);
aesl_fh.write(AUTOTB_TVIN_forward_B_sel_out, end_str());
}

// print hazard_dest_out Transactions
{
aesl_fh.write(AUTOTB_TVIN_hazard_dest_out, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_hazard_dest_out);
aesl_fh.write(AUTOTB_TVIN_hazard_dest_out, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.hazard_dest_out_depth);
aesl_fh.write(AUTOTB_TVIN_hazard_dest_out, end_str());
}

// print pc_out Transactions
{
aesl_fh.write(AUTOTB_TVIN_pc_out, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_pc_out);
aesl_fh.write(AUTOTB_TVIN_pc_out, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.pc_out_depth);
aesl_fh.write(AUTOTB_TVIN_pc_out, end_str());
}

CodeState = CALL_C_DUT;
pipeline_top_hw_stub_wrapper(__xlx_apatb_param_reset, __xlx_apatb_param_stall_out, __xlx_apatb_param_forward_A_sel_out, __xlx_apatb_param_forward_B_sel_out, __xlx_apatb_param_hazard_dest_out, __xlx_apatb_param_pc_out);
CodeState = DUMP_OUTPUTS;
// print stall_out Transactions
{
aesl_fh.write(AUTOTB_TVOUT_stall_out, begin_str(AESL_transaction));
{
    sc_bv<1> __xlx_tmp_lv = *((char*)__xlx_apatb_param_stall_out);
aesl_fh.write(AUTOTB_TVOUT_stall_out, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.stall_out_depth);
aesl_fh.write(AUTOTB_TVOUT_stall_out, end_str());
}

// print forward_A_sel_out Transactions
{
aesl_fh.write(AUTOTB_TVOUT_forward_A_sel_out, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_forward_A_sel_out);
aesl_fh.write(AUTOTB_TVOUT_forward_A_sel_out, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.forward_A_sel_out_depth);
aesl_fh.write(AUTOTB_TVOUT_forward_A_sel_out, end_str());
}

// print forward_B_sel_out Transactions
{
aesl_fh.write(AUTOTB_TVOUT_forward_B_sel_out, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_forward_B_sel_out);
aesl_fh.write(AUTOTB_TVOUT_forward_B_sel_out, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.forward_B_sel_out_depth);
aesl_fh.write(AUTOTB_TVOUT_forward_B_sel_out, end_str());
}

// print hazard_dest_out Transactions
{
aesl_fh.write(AUTOTB_TVOUT_hazard_dest_out, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_hazard_dest_out);
aesl_fh.write(AUTOTB_TVOUT_hazard_dest_out, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.hazard_dest_out_depth);
aesl_fh.write(AUTOTB_TVOUT_hazard_dest_out, end_str());
}

// print pc_out Transactions
{
aesl_fh.write(AUTOTB_TVOUT_pc_out, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_pc_out);
aesl_fh.write(AUTOTB_TVOUT_pc_out, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.pc_out_depth);
aesl_fh.write(AUTOTB_TVOUT_pc_out, end_str());
}

CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
