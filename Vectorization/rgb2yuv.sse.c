/*
* SSE optimization of RGB2YUV
*/
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <emmintrin.h>

#define N 4000000
/* #define DEBUG 0 */

typedef struct s_pixel_rgb {
	float *r;
	float *g;
	float *b;
} t_pixel_rgb;

typedef struct s_pixel_yuv {
	float *y;
	float *u;
	float *v;
} t_pixel_yuv;

void rgb_to_yuv(t_pixel_rgb rgb, t_pixel_yuv yuv, int len, int N_iter)
{
	int i,j;
    __m128 yred = _mm_set1_ps(0.299f);
    __m128 ygreen = _mm_set1_ps(0.587f);
    __m128 yblue = _mm_set1_ps(0.114f);
    
    __m128 ured = _mm_set1_ps(0.147f);
    __m128 ugreen = _mm_set1_ps(0.289f);
    __m128 ublue = _mm_set1_ps(0.436f);
    
    __m128 vred = _mm_set1_ps(0.615f);
    __m128 vgreen = _mm_set1_ps(0.515f);
    __m128 vblue = _mm_set1_ps(0.100f);   
    
    __m128 R,G,B,Y,U,V;   
    
    for (j=0; j<N_iter; j++){
      for (i=0; i<len; i+=4) {
          //R = _mm_setr_ps(rgb[i].r,rgb[i+1].r,rgb[i+2].r,rgb[i+3].r);
          //G = _mm_setr_ps(rgb[i].g,rgb[i+1].g,rgb[i+2].g,rgb[i+3].g);
          //B = _mm_setr_ps(rgb[i].b,rgb[i+1].b,rgb[i+2].b,rgb[i+3].b); 
          R = _mm_load_ps(&rgb.r[i]);
		  G = _mm_load_ps(&rgb.g[i]);
		  B = _mm_load_ps(&rgb.b[i]);
		  
          Y = _mm_mul_ps(R, yred);
          Y = _mm_add_ps(Y, _mm_mul_ps(G, ygreen));
          Y = _mm_add_ps(Y, _mm_mul_ps(B, yblue));
          
          U = _mm_mul_ps(B, ublue);
          U = _mm_sub_ps(U, _mm_mul_ps(R, ured));
          U = _mm_sub_ps(U, _mm_mul_ps(G, ugreen));         
          
          V = _mm_mul_ps(R, vred);
          V = _mm_sub_ps(V, _mm_mul_ps(G, vgreen));
          V = _mm_sub_ps(V, _mm_mul_ps(B, vblue));
          
          _mm_store_ps(&yuv.y[i] ,Y);
          _mm_store_ps(&yuv.u[i] ,U);
          _mm_store_ps(&yuv.v[i] ,V);
      }

    }
	
}

int main (int argc, char *argv[])
{
  t_pixel_rgb rgb; t_pixel_yuv yuv; // Vectores para malloc

  int i;
  int n=N; // tamanyo vectores
  int NIt=50; // Num.iters

  if (argc>1) NIt = atoi(argv[1]);
  if (argc>2) n = atoi(argv[2]);

  if (n>N) { printf("Maxima longitud vector: %d\n",N); exit(-1); }

  /*if (posix_memalign((void**)&rgb, 16, n*sizeof(t_pixel_rgb)) !=0) {
      fprintf(stderr, "No memory.\n");
      exit(-1);
  }*/
  /*if (posix_memalign((void**)&yuv, 16, n*sizeof(t_pixel_yuv)) !=0) {
      fprintf(stderr, "No memory.\n");
      exit(-1);
  }*/
  if (posix_memalign((void**)(&(rgb.r)), 16, 3+n*sizeof(float)) !=0) {
      fprintf(stderr, "No memory.\n");
      exit(-1);
  } 
  if (posix_memalign((void**)(&(rgb.g)), 16, 3+n*sizeof(float)) !=0) {
      fprintf(stderr, "No memory.\n");
      exit(-1);
  } 
  if (posix_memalign((void**)(&(rgb.b)), 16, 3+n*sizeof(float)) !=0) {
      fprintf(stderr, "No memory.\n");
      exit(-1);
  }   
  if (posix_memalign((void**)(&(yuv.y)), 16, 3+n*sizeof(float)) !=0) {
      fprintf(stderr, "No memory.\n");
      exit(-1);
  } 
  if (posix_memalign((void**)(&(yuv.u)), 16, 3+n*sizeof(float)) !=0) {
      fprintf(stderr, "No memory.\n");
      exit(-1);
  } 
  if (posix_memalign((void**)(&(yuv.v)), 16, 3+n*sizeof(float)) !=0) {
      fprintf(stderr, "No memory.\n");
      exit(-1);
  } 
  
  
  for (i=0;i<n;i++) {
     rgb.r[i]=(float) ((i<<26) ^ ((i + 340) << 22) ^ i ^ 0xf215fabc);
     rgb.g[i]=(float) (((i+450)<<27) ^ ((i + 567) <<20) ^ i ^ 0xb152e8ca);
     rgb.b[i]=(float) (((i+7823454) << 25) ^0xbad51cde);
  }

  
  rgb_to_yuv(rgb, yuv, n, NIt);
  for(i=0; i<5; i++) printf("y%f  u%f  v%f\n", yuv.y[i], yuv.u[i], yuv.v[i]);
  write(1, yuv, n*sizeof(t_pixel_yuv));
    
  return(0);
}
