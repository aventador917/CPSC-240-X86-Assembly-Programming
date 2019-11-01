
#include<iostream>

using namespace std;
extern  "C" int Manage();
int main()
{
                cout<< "This is the CS 240 midterm written by Paul Tang."<<endl;
                int number = Manage();
                cout<< "The main program received this number: "<<number<<" and will now return to the operating system."<<endl;

                return 0;
}
