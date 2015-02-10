/*
*	Transforms RGB to YUV values
*/
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

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
	int i,j;

     for (j=0; j<N_iter; j++)
	for (i=0; i<len; i++) {
		yuv[i].y = 0.299 * rgb[i].r + 0.587 * rgb[i].g + 0.114 * rgb[i].b;
		yuv[i].u = 0.492 * (rgb[i].b - yuv[i].y);
		yuv[i].v = 0.877 * (rgb[i].r - yuv[i].y);
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

  if (posix_memalign((void**)&rgb, 16, n*sizeof(t_pixel_rgb)) !=0) {
      fprintf(stderr, "No memory.\n");
      exit(-1);
  }
  if (posix_memalign((void**)&yuv, 16, n*sizeof(t_pixel_yuv)) !=0) {
      fprintf(stderr, "No memory.\n");
      exit(-1);
  }
 
  for (i=0;i<n;i++) {
     rgb[i].r=(float) ((i<<26) ^ ((i + 340) << 22) ^ i ^ 0xf215fabc);
     rgb[i].g=(float) (((i+450)<<27) ^ ((i + 567) <<20) ^ i ^ 0xb152e8ca);
     rgb[i].b=(float) (((i+7823454) << 25) ^0xbad51cde);
  }

  rgb_to_yuv(rgb, yuv, n, NIt);
for(i=0; i<5; i++) printf("y%f  u%f  v%f\n", yuv[i].y, yuv[i].u, yuv[i].v);
  write(1, yuv, n*sizeof(t_pixel_yuv));
  
  return(0);
}
