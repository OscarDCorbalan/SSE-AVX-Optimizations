/*
*	Program to test compiler unrolling capabilities.
*
*										Y/N unroll	Details
*	-O0 								N
*	-O0	-funroll-loops					N
*	-O0	-funroll-all-loops 				N
*	-O1									N
*	-O1 -funroll-loops					Y			but no memoization
*	-O2									N
*	-O2 -funroll-loops					Y			but no memoization 
*	-O3									Y			compiler also does memoization
*	-O3	-funroll-loops					same as above
*	-O3 --param max-unrolled-insns=x	same as above for x=100,50,5
*	-O3	-fno-unroll-loops				same as above
*	-Os									N
*	-Os -funroll-loops					N
*
*/


#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define N_ITER 400000000
#define multiplica(A, B, C)\
{	\
   int iter;\
   int i,j,k;\
   for (iter=0; iter<n_iter; iter++)\
   {\
      for (i = 0; i < 4; i++) \
      {\
        for (j = 0; j < 4; j++) \
	{\
           for (k = 0; k < 4; k++) \
	   {\
              C[i][j] = C[i][j] + A[i][k] * B[k][j];\
	   }\
	}\
      }\
   }\
}


void print_matriu(int C[][4])
{
   int i,j,k;

   for (i = 0; i < 4; i++) 
   {
     for (j = 0; j < 4; j++) 
     {
       printf("%d ", C[i][j]);
     }
     printf("\n");
   }
}

int main(int argc, char *argv[])
{
    int A[4][4], B[4][4], C[4][4] = {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}};
    unsigned int n_iter=N_ITER, i,j;

    for (i=0; i<4; i++) {
        for (j=0; j<4; j++) {
            A[i][j] = rand();
            B[i][j] = rand();
        }
    }

    if (argc > 1) {
	n_iter = atoi(argv[1]); 
    }

    multiplica(A, B, C);

    print_matriu(C);
         
    return 0;
}
