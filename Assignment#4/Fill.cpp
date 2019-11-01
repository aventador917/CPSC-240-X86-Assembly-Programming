#include<iostream>
using namespace std;
extern "C" long Fill(unsigned long *myarray, long index);

long Fill(unsigned long *myarray, long index){

  long indexF = 0;
  long counter = 0;
  while(indexF < index && !(cin.eof()))
  {
    cin>>myarray[indexF];
    indexF++;
    counter++;
  }

  cin.ignore(1000,'\n');
  cin.clear();
  return counter-1;
}
