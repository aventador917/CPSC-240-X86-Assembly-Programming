#include<iostream>
using namespace std;

extern "C" int StatisticalNum();
int main(){
  int return_code;
  return_code = StatisticalNum();
  cout<<"Welcome to Statistical Numbers";
  cout<<"\nBought to you by fanghua gu";
  cout<<"This is the C++ program responding. Here we received the number "<<return_code<<"Have a nice day";
  cout<<"\nThe C++ program will not return a zero to the operating system.";
  return 0;
}
