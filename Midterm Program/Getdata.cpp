
#include<iostream>

using namespace std;
extern "C" int Getdata(int *arr,int size);

int Getdata( int *arr , int size)
{
            cout<<"Please enter integer data to be stored in your array. Press enter and Cntl+D to terminate: ";
     
    int indexF = 0;
    int counter = 0;
    while(indexF < size && !(cin.eof()))
    {
        cin>>arr[indexF];
        indexF++;
        counter++;
     }
  cin.ignore();
    return counter -1;
}
