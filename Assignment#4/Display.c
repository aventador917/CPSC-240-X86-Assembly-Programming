#include<stdio.h>
//Display(unsigned long myarray[], long index);

void Display(unsigned long myarray[], long index){

  for(long i=0; i < index;i++){
    printf("%ld",myarray[i]);
    printf("%s"," ");
  }
}
