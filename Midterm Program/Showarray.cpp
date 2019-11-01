
#include<iostream>

using namespace std;
extern "C" void Showarray( int array[], int size);
void Showarray( int array[], int size)
{
    for( int i=0; i<size;i++)
    {
        cout<<array[i]<<endl;
    }
}
