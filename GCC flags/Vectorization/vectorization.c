/*
*	Program to test compiler vectorization capabilities.
*******
*** This one depends a lot on CPU architecture and compiler, so I'm not giving any expected results, but explain a bit instead.
*******
*	Compile with flag  -ftree-vectorizer-verbose=2 and different optimization levels and check the output on the console.
*	Now try to combine with these flags: 
*		-ftree-vectorizer-verbose=2 -ftree-vectorize -march=core2 -O0
*		-ftree-vectorizer-verbose=2 -ftree-vectorize -march=core2 -Os
*		-ftree-vectorizer-verbose=2 -ftree-vectorize -march=core2 -O1
*		-ftree-vectorizer-verbose=2 -ftree-vectorize -march=core2 -O2
*		-ftree-vectorizer-verbose=2 -ftree-vectorize -march=core2 -O3
*	Note than indicating the march, the compiler knows a lot more of our machine and its vectorizing capabilities
*	Also, try to compile WITHOUT the -ftree-vectorize flag.
*	Compare in all cases the number of optimized loops, and note that when some loop is not optimized,
*	the compiler gives you a reason, so in many cases you should be able to change it (i.e. aliasing)
*	Some times it will also tell that the vectorization is simply not profitable (important info for you if you want to hand-make it)
*
*	If you want, also try to use the -march option that suits your machine, since the results can change.	
*
*	Also, if you want to deactivate the vectorizer (i.e. for floating point precisions reasons), you can
*	use fno-tree-vectorize flag:
*		-ftree-vectorizer-verbose=2 -fno-tree-vectorize -march=core2 -O3
*	Telling the compiler explicitly to not vectorize although it would. Check that then there's no vectorization.
*
*
*	To finish, remember that, in any case, you can output the assembler code with the flag -S
*/

#include <memory.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX	16
#define N	256
#define M	256
#define K	256
typedef int aint __attribute__ ((__aligned__(16)));
int a[256], b[256], c[256],d[256],in[256],out[256];

foo1 () {
  int i;

  for (i=0; i<256; i++){
    a[i] = b[i] + c[i];
  }
}

foo2 (int n, int x) {
   int i;

   /* feature: support for unknown loop bound  */
   /* feature: support for loop invariants  */
   for (i=0; i<n; i++){
      b[i] = x;
   }

   /* feature: general loop exit condition  */
   /* feature: support for bitwise operations  */
   while (n--){
      a[i] = b[i]&c[i]; i++;
   }
}

foo3 (int n, aint * __restrict__ p, aint * __restrict q) {

   /* feature: support for (aligned) pointer accesses.  */
   while (n--){
      *p++ = *q++;
   }
}

foo4 (int n, aint * __restrict__ p, aint * __restrict__ q) {
   int i,j;

   /* feature: support for (aligned) pointer accesses  */
   /* feature: support for constants  */
   while (n--){
      *p++ = *q++ + 5;
   }

   /* feature: support for read accesses with a compile time known misalignment  */
   for (i=0; i<n; i++){
      a[i] = b[i+1] + c[i+3];
   }

   /* feature: support for if-conversion  */
   for (i=0; i<n; i++){
      j = a[i];
      b[i] = (j > MAX ? MAX : 0);
   }
}

struct aaa {
  int ca[N];
} s;
foo6(){
	int i;
	for (i = 0; i < N; i++)
	  {
		/* feature: support for alignable struct access  */
		s.ca[i] = 5;
	  }
}

/* feature: support for read accesses with an unknown misalignment  */
foo7(int x) {
   int i;   
   for (i=0; i<N; i++){
      a[i] = b[i+x];
   }
}

/* feature: support for multidimensional arrays  */
int e[M][N];
foo8 (int x) {
   int i,j;   
   for (i=0; i<M; i++) {
     for (j=0; j<N; j++) {
       e[i][j] = x;
     }
   }
}

unsigned int ub[N], uc[N];
foo9 () {
  int i;
  /* feature: support summation reduction.
     note: in case of floats use -funsafe-math-optimizations  */
  unsigned int diff = 0;
  for (i = 0; i < N; i++) {
    diff += (ub[i] - uc[i]);
  }
}


/* feature: support data-types of different sizes.
   Currently only a single vector-size per target is supported; 
   it can accommodate n elements such that n = vector-size/element-size 
   (e.g, 4 ints, 8 shorts, or 16 chars for a vector of size 16 bytes). 
   A combination of data-types of different sizes in the same loop 
   requires special handling. This support is now present in mainline,
   and also includes support for type conversions.  */

 foo10(){
	short *sa, *sb, *sc;
	int *ia, *ib, *ic;
	int i;
	for (i = 0; i < N; i++) {
	  ia[i] = ib[i] + ic[i];
	  sa[i] = sb[i] + sc[i];
	}

	for (i = 0; i < N; i++) {
	  ia[i] = (int) sb[i];
	}
}

/* feature: support strided accesses - the data elements
   that are to be operated upon in parallel are not consecutive - they
   are accessed with a stride > 1 (in the example, the stride is 2):  */
foo11(){
	int i;
	for (i = 0; i < N/2; i++){
	  a[i] = b[2*i+1] * c[2*i+1] - b[2*i] * c[2*i];
	  d[i] = b[2*i] * c[2*i+1] + b[2*i+1] * c[2*i];
	}
}

/* induction*/
foo12(){
	int i;
	for (i = 0; i < N; i++) {
	  a[i] = i;
	}
}

/* outer-loop */
int f[M][N];
foo13(){
int i,j,diff;
  for (i = 0; i < M; i++) {
    diff = 0;
    for (j = 0; j < N; j+=8) {
      diff += (e[i][j] - f[i][j]);
    }
    out[i] = diff;
  }
}

/* double reduction*/
int coeff[N][M];
foo14(){
int i,j,k,sum;
  for (k = 0; k < K; k++) {
    sum = 0;
    for (j = 0; j < M; j++)
      for (i = 0; i < N; i++)
          sum += f[i+k][j] * coeff[i][j];

    out[k] = sum;
  }
}
 
 /*condition in nested loop*/
foo15(){
int i,j,x,x_in[256],curr_a,next_a,x_out[256];
  for (j = 0; j < M; j++)
    {
      x = x_in[j];
      curr_a = a[0];

      for (i = 0; i < N; i++)
        {
          next_a = a[i+1];
          curr_a = x > c[i] ? curr_a : next_a;
        }

      x_out[j] = curr_a;
    }
}

/* basic block SLP */
void foo16 ()
{
  unsigned int *pin = &in[0];
  unsigned int *pout = &out[0];

  *pout++ = *pin++;
  *pout++ = *pin++;
  *pout++ = *pin++;
  *pout++ = *pin++;
}

int main(int argc, char *argv[])
{
	foo1();
	foo2(1891,658);
	foo3(81981,a,b);
	foo4(8189198,a,c);
	foo6();
	foo7(1);
	foo8(34654);
	foo9();
	foo10();
	foo11();
	foo12();
	foo13();
	foo14();
	foo15();
	foo16();
	
	 
    return 0;
}