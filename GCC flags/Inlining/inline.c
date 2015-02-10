/*
*	Code example to test compiler function inlining flags.
*	-O0 and -O1 shouldn't make any inlining.
*	-O2 should inline getValue2
*	-O3 -fno-inline-functions should do the same that -O2 does
*	-O3 should inline both functions
*	-Os should't inline, but simplyfe the for loop.
*
*	Note these are probable results, as it may change with different compiler programs and/or versions, as well as different CPUs
*/
#include <stdlib.h>
#include <stdio.h>


int getValue1(){
	return random(100)-40;
}

inline int getValue2(){
	return random(100)-60;
}

int main() {
  int one,two,i,j;
  for(j=0; j<40000000; j++){
	one = getValue1();
	two = getValue2();
	i = one+two;
  }
  printf("i = %d", i);
  return 1;
}