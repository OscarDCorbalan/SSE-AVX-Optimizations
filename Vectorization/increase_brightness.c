/*
* Increases brightness
*/
#include <stdio.h>
#include <stdlib.h>

#define N 16000000

typedef struct s_pixel_rgb {
	unsigned char r;
	unsigned char g;
	unsigned char b;
} t_pixel_rgb;


void increase_brightness (t_pixel_rgb *rgb, int len, unsigned char inc, int N_iter)
{
	int i,j;

     for (j=0; j<N_iter; j++)
	for (i=0; i<len; i++) {
		//cambio
		if (rgb[i].r < inc) {
			rgb[i].r = 0 ;
		} else {
			rgb[i].r -= inc;
		}
		//fin cambio
		if ((rgb[i].g + inc) > 255) {
			rgb[i].g = 255;
		} else {
			rgb[i].g += inc;
		}

		if ((rgb[i].b + inc) > 255) {
			rgb[i].b = 255;
		} else {
			rgb[i].b += inc;
		}
	}
}

int main (int argc, char *argv[])
{

  t_pixel_rgb *A;
  int i;
  int n=N; // tamanyo vectores
  int NIt=50; // Num.iters
  unsigned char incr=1;

  if (argc>1) NIt = atoi(argv[1]);
  if (argc>2) n = atoi(argv[2]);
  if (argc>3) incr = (unsigned char) atoi(argv[3]);

  if (n>N) { printf("Maxima longitud vector: %d\n",N); exit(-1); }

  if (posix_memalign((void**)&A, 16, n*sizeof(t_pixel_rgb)) != 0) {
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
