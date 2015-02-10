/*
* SSE-optimized increase_brightness.c
*/
#include <assert.h>
#include <emmintrin.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>

#define N 16000000

typedef struct s_pixel_rgb {
	unsigned char r;
	unsigned char g;
	unsigned char b;
} t_pixel_rgb;

void increase_brightness(t_pixel_rgb *rgb, int len, unsigned char inc, int N_iter)
{
	unsigned int i,j,k;
	__m128i  t1,t2,t3,s1,s2,s3,r1,r2,r3;
	__m128i* pr = (__m128i *)((uintptr_t)rgb);
	
	s1 = _mm_set_epi8(0,inc,inc,0,inc,inc,0,inc,inc,0,inc,inc,0,inc,inc,0); //cambio
	s2 = _mm_set_epi8(inc,0,inc,inc,0,inc,inc,0,inc,inc,0,inc,inc,0,inc,inc);//cambio
	s3 = _mm_set_epi8(inc,inc,0,inc,inc,0,inc,inc,0,inc,inc,0,inc,inc,0,inc);//cambio
	r1 = _mm_set_epi8(inc,0,0,inc,0,0,inc,0,0,inc,0,0,inc,0,0,inc); //cambio
	r2 = _mm_set_epi8(0,inc,0,0,inc,0,0,inc,0,0,inc,0,0,inc,0,0);//cambio
	r3 = _mm_set_epi8(0,0,inc,0,0,inc,0,0,inc,0,0,inc,0,0,inc,0);//cambio
	
	for (k=0; k<N_iter; k++){
		for (i=0, j=0; j<len*sizeof(t_pixel_rgb); j+=48, i+=3){
		
			t1 = _mm_load_si128(pr+i);
			t2 = _mm_load_si128(pr+i+1);
			t3 = _mm_load_si128(pr+i+2);
			
			t1 = _mm_adds_epu8(t1,s1);
            t2 = _mm_adds_epu8(t2,s2); 
            t3 = _mm_adds_epu8(t3,s3);           
			t1 = _mm_subs_epu8(t1,r1);
			t2 = _mm_subs_epu8(t2,r2);
			t3 = _mm_subs_epu8(t3,r3);		
			
			_mm_store_si128(pr+i,t1);
			_mm_store_si128(pr+i+1,t2);
			_mm_store_si128(pr+i+2,t3);
        }
    }
}

int main (int argc, char *argv[])
{

  t_pixel_rgb *A;
  unsigned int i;
  unsigned int n=N; // tamanyo vectores
  unsigned int NIt=50; // Num.iters
  unsigned char incr=1;
  
  if (argc>1) NIt = atoi(argv[1]);
  if (argc>2) n = atoi(argv[2]);
  if (argc>3) incr = (unsigned char) atoi(argv[3]);

  if (n>N) { printf("Maxima longitud vector: %d\n",N); exit(-1); }

  if (posix_memalign((void**)&A, 16, 47+n*sizeof(t_pixel_rgb)) != 0) {
      fprintf(stderr, "No hay memoria.\n");
      exit(-1);
  }

   /* Inicialitzacio nombres "aleatoris" */
   for (i=0;i<n;i++) {
     A[i].r= i^(i-54) & 0x2f;
     A[i].g= (i+89)^(i-200) & 0x2f;
     A[i].b= (i+70)^(i+325) &0x2f;
   }
   
  //for(i=0; i<n; i++) printf("r%d  g%d  b%d\n", A[i].r, A[i].g, A[i].b);
   increase_brightness (A, n, incr, NIt); 
  //for(i=0; i<n; i++) printf("r%d  g%d  b%d\n", A[i].r, A[i].g, A[i].b);
  
   write(1, A, n*sizeof(t_pixel_rgb));

   return(0);
}
