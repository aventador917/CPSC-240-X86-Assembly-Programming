#include <stdio.h>
#include <stdint.h>
#include <cstring>
#include <iostream>
#include <iomanip>
#include <math.h>
#include <stdlib.h>
#include <string>

using namespace std;
//call asm code in cpp by useing extern"c"+ asm function name
extern"C" int Control();
char buffer [33];
 
char * inttohex(int aa)
{
    sprintf(buffer, "%x", aa);
    return (buffer);
}


int main(){
  char*hex_str;
  int Total = Control();
  printf("This programmnig is made by Fanghua Gu\n");
  printf("The author is an avid fan of multilingual program and assembly programming\n");
  hex_str = inttohex(Total);
  string result = string(hex_str);
 
 if(result.size() < 16)
  {
	
	size_t empty = 16 - result.size();
	result.resize(16,'0');
	for(size_t i =0;i<result.size();i++)
	{
	   result[i+empty] = result[i];
        }
	for(size_t j=0;j<empty;j++)
	{
	    result[j] = '0';
        }
  }
  cout << "0x" <<result <<endl;
  printf("Thanks for the nice numbers you sent to me\n" );
  printf("Have a nice day\n");

return 0;
}
