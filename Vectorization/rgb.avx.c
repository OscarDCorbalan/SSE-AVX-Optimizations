/*
*	Optimized rgb.c using AVX instructions
*/
#include <stdio.h>
#include <stdlib.h>
#include <emmintrin.h>

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <avxintrin.h>

typedef struct {
   char r;
   char g;
   char b;
} Tpixel;

#define ROWS 5000
#define COLUMNS 20000

Tpixel **buffer;//[ROWS][COLUMNS];
char *p;
	
void rgb_verd()
{
  unsigned int i,j;
  __m256i c1 = _mm256_set_epi8( 1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0);
  __m256i c2 = _mm256_set_epi8( 0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0);
  __m256i c3 = _mm256_set_epi8( 0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1);
  
  __m256i* ptr = (__m256i *)p;
  
	for(i=0; i<COLUMNS*ROWS*3; i+=96, ptr+=3){
		//printf("%d %d %c %d %c\n", i, (unsigned int)ptr, (int)p+i, &buffer, *p);
		_mm256_store_si256( ptr,   c1);
		_mm256_store_si256( ptr+1 ,c2);
		_mm256_store_si256( ptr+2 ,c3);		
	}
	
}

int main(int argc, char *argv[])
{
	
	posix_memalign((void**)&p, 32, ROWS*COLUMNS*3);
  	rgb_verd(	);
  	buffer = (Tpixel **) p;

	/*int i; 
	//char *p = (char*) &buffer;
	printf("\n\n\n");
	for(i=0; i<COLUMNS*ROWS*3; i++){
		if(p[i] == 0) printf("0");
		else if(p[i] == 1) printf("1");
		else printf("e");
	}*/
	
	write(1, buffer, ROWS*COLUMNS*3);

  return(0);
}

