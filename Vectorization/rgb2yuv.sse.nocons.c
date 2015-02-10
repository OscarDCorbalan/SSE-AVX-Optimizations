/*
* SSE optimization of RGB2YUV, without consecutiveness
*/
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <assert.h>
#include <emmintrin.h>
#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <unistd.h>

#define N 4000000
/* #define DEBUG 0 */

typedef struct s_pixel_rgb {
	float r;
	float g;
	float b;
} t_pixel_rgb;

typedef struct s_pixel_yuv {
	float y;
	float u;
	float v;
} t_pixel_yuv;

void rgb_to_yuv(t_pixel_rgb *rgb, t_pixel_yuv *yuv, int len, int N_iter)
{
  unsigned int i,j;
  __m128  R,G,B,Y,U,V,rr,gg,bb,y1,y2;
  float __attribute__((__aligned__(16))) buf[4],cuf[4];
  rr = _mm_set1_ps(0.299);
  gg = _mm_set1_ps(0.587f);
  bb = _mm_set1_ps(0.114f);
  y1 = _mm_set1_ps(0.492f);
  y2 = _mm_set1_ps(0.877f);
  
  for (j=0; j<N_iter; j++){
    for (i=0; i<len; i+=4) {
      //printf("%di\n",i);
      R = _mm_setr_ps(rgb[i].r,rgb[i+1].r,rgb[i+2].r,rgb[i+3].r);
      G = _mm_setr_ps(rgb[i].g,rgb[i+1].g,rgb[i+2].g,rgb[i+3].g);
      B = _mm_setr_ps(rgb[i].b,rgb[i+1].b,rgb[i+2].b,rgb[i+3].b);
      R = _mm_mul_ps(R,rr);
      G = _mm_mul_ps(G,gg);
      B = _mm_mul_ps(B,bb);
      Y = _mm_add_ps( R, _mm_add_ps(G,B));
      _mm_store_ps(buf,Y);
      yuv[i].y = buf[0];
      yuv[i+1].y = buf[1];
      yuv[i+2].y = buf[2];
      yuv[i+3].y = buf[3];
      //yuv[i].y = 0.299 * rgb[i].r + 0.587 * rgb[i].g + 0.114 * rgb[i].b;
    }
    for (i=0; i<len; i+=4) {
      R = _mm_setr_ps(rgb[i].r,rgb[i+1].r,rgb[i+2].r,rgb[i+3].r);
      B = _mm_setr_ps(rgb[i].b,rgb[i+1].b,rgb[i+2].b,rgb[i+3].b);     
      Y = _mm_setr_ps(yuv[i].y,yuv[i+1].y,yuv[i+2].y,yuv[i+3].y);
      U = _mm_mul_ps (y1, _mm_sub_ps(B,Y));
      V = _mm_mul_ps (y2, _mm_sub_ps(R,Y));
      _mm_store_ps(buf,U);
      _mm_store_ps(cuf,V);
      yuv[i].u = buf[0];
      yuv[i+1].u = buf[1];
      yuv[i+2].u = buf[2];
      yuv[i+3].u = buf[3];
      yuv[i].v = cuf[0];
      yuv[i+1].v = cuf[1];
      yuv[i+2].v = cuf[2];
      yuv[i+3].v = cuf[3];
      
      //yuv[i].u = 0.492 * (rgb[i].b - yuv[i].y);
      //yuv[i].v = 0.877 * (rgb[i].r - yuv[i].y);
    }
  }
}

int main (int argc, char *argv[])
{
  t_pixel_rgb *rgb; t_pixel_yuv *yuv; // Vectores para malloc

  int i;
  int n=N; // tamanyo vectores
  int NIt=50; // Num.iters

  if (argc>1) NIt = atoi(argv[1]);
  if (argc>2) n = atoi(argv[2]);

  if (n>N) { printf("Maxima longitud vector: %d\n",N); exit(-1); }

  if (posix_memalign((void**)&rgb, 16, 3+n*sizeof(t_pixel_rgb)) !=0) {
      fprintf(stderr, "No memory.\n");
      exit(-1);
  }
  if (posix_memalign((void**)&yuv, 16, 3+n*sizeof(t_pixel_yuv)) !=0) {
      fprintf(stderr, "No memory.\n");
      exit(-1);
  }
 
  for (i=0;i<n;i++) {
     rgb[i].r=(float) ((i<<26) ^ ((i + 340) << 22) ^ i ^ 0xf215fabc);
     rgb[i].g=(float) (((i+450)<<27) ^ ((i + 567) <<20) ^ i ^ 0xb152e8ca);
     rgb[i].b=(float) (((i+7823454) << 25) ^0xbad51cde);
  }

  rgb_to_yuv(rgb, yuv, n, NIt);

  write(1, yuv, n*sizeof(t_pixel_yuv));
  
  return(0);
}
