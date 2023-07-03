#include <hls_stream.h>
using namespace hls;

#include <iostream>
using namespace std;

#include <ap_int.h>

typedef ap_uint<2> d_out;
typedef ap_uint<1> d_bool;

void PN_GEN(int len,stream<d_out> &out, bool &last);
void printBinary(int num);
void printBinary(int num) {
   switch (num) {
       case 0:
    	   cout<<"00";
           break;
       case 1:
    	   cout<<"01";
           break;
       case 2:
    	   cout<<"10";
           break;
       case 3:
    	   cout<<"11";
           break;
       default:
           break;
   }
}
int main(){
	int len=11;
	stream<d_out> out;
	d_out output;
	bool last;
	PN_GEN(len,out,last);

	if (len%2==0){
		while (!out.empty()){
				out>>output;
				 printBinary(output);
		}
	}
	else{
		for (int i=0;i<len/2;i++){
			out>>output;
			printBinary(output);
		}
		out>>output;
		cout<<output<<endl;

	}
}
