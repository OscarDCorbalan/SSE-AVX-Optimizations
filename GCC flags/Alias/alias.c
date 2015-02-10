/*
*
* 	This example is to show how aliasing optimizations can make your code not work:
*	Note that the pointer f points to the same memory location than the variable i.
*	Or another way to tell the same: f is an alias to i.
*	Part of the aliasing optimizations consist on supposing that variables in the code
* 	that are of different types, can never point to the same memory location.
* 	BUT, since we can, for example, cast types (or use pointer arithmetics),
*	that can be a problem.
* 
* 	Also, note that since the pointer f is no longer used after the '0.' allocation,
* 	the optimizater *might* just remove that line.
*
* 	Check that compiling+running this code in O0 gives the correct output which is:
*	 3 -> 0
*
* 	Now compile it with different optimization levels and see if you get some bad output.
*
*
* 	If you had a bad output with O2 or O3 optimization levels, try to compile it again
* 	but adding the flag -fno-strict-aliasing . Check it again.
*
*/

#include <stdio.h>
#include <stdlib.h>

int main() {
  int i = 3;
  float *f = (float*) &i;

  printf("%d -> ", i);

  *f = 0.;
  printf( "%d\n", i);
  
  return 1;
}
