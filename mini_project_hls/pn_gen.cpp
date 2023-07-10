#include <hls_stream.h>
using namespace hls;

#include <ap_int.h>
typedef ap_uint<2> int2_t;

#define array_size 33
#define Nc 1600

void PN_GEN(int length,stream<int2_t> &out, bool &last) {
#pragma HLS INTERFACE ap_none port=last
#pragma HLS INTERFACE axis off port=out
	 // Define the first and second m-sequence
    bool x1[array_size]={0};
#pragma HLS ARRAY_RESHAPE variable=x1 complete dim=1
    bool x2[array_size]={0};
#pragma HLS ARRAY_RESHAPE variable=x2 complete dim=1
    //initialize  depending on the application of the sequence.
    int cint = 100;
    // initialize the first and second m-sequence
    x1[0] = 1;
    for (int i = 0; i < 31; i++) {
#pragma HLS UNROLL
           x2[i] = (cint >> i) & 1;
       }
 // Determine the initial count value based on  PN sequence length
    int count=(length%2!=0)?-1:0;
// Generate the pseudo-random sequence
    for (int n = 0; n < Nc+length; n=n+2) {
#pragma HLS PIPELINE
#pragma HLS LOOP_TRIPCOUNT

    	// Update the sequence based on the feedback polynomial
    	x1[(n+31)%array_size] = x1[(n+3)%array_size] ^ x1[n%array_size];
    	x2[(n+31)%array_size] = x2[(n+3)%array_size] ^ x2[(n+2)%array_size] ^ x2[(n+1)%array_size] ^ x2[n%array_size];
    	x1[(n+32)%array_size] = x1[(n+4)%array_size] ^ x1[(n+1)%array_size];
    	x2[(n+32)%array_size] = x2[(n+4)%array_size] ^ x2[(n+3)%array_size] ^ x2[(n+2)%array_size] ^ x2[(n+1)%array_size];
    	// Compute the output bits
    	if (n >=Nc) {
    		bool bit1 = (x1[n%array_size] ^ x2[n%array_size]);
    		bool bit2 = (x1[(n+1)%array_size] ^ x2[(n+1)%array_size]);
    		count=count+2;
            // trigger the last signal to indicate end of output sequence
            if (count==length){
             		last=true;
             	}
            else{
             		last=false;
            	}
            //2 consecutive pn sequence bit output per clock cycle
    		int2_t res= (length%2!=0 & count==length)?bit1:(bit1 << 1) | bit2;
            out.write(res);
            }
 	 }
}
