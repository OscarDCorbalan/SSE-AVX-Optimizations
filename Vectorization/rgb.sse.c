/*
*	Optimized rgb.c using SSE instructions
*/
#include <stdio.h>
#include <stdlib.h>
#include <emmintrin.h>

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <unistd.h>

typedef struct {
   char r;
   char g;
   char b;
} Tpixel;

#define ROWS 1000//5000
#define COLUMNS 3000//20000

Tpixel buffer[ROWS][COLUMNS];

void rgb_verd()
{
  unsigned int i,j;
  char *p = (char*) &buffer;
  __m128i c1 =	_mm_set_epi8( 0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0);
  __m128i c2 =	_mm_set_epi8( 1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1);
  __m128i c3 =	_mm_set_epi8( 0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0);
  __m128i* ptr = (__m128i *)(((uintptr_t)buffer) );//& ~0x0F);
  
	for(i=0; i<COLUMNS*ROWS*3; i+=48, ptr+=3){
		//printf("%d %d %d %d %d\n", i, ptr, p+i, &buffer, p);
		_mm_storeu_si128( ptr,   c1);
		_mm_storeu_si128( ptr+1 ,c2);
		_mm_storeu_si128( ptr+2 ,c3);		
	}
	
}

int main(int argc, char *argv[])
{
  rgb_verd();
	/*
	int i; 
	char *p = (char*) &buffer;
	printf("\n\n\n");
	for(i=0; i<COLUMNS*ROWS*3; i++){
		if(p[i] == 0) printf("0");
		else if(p[i] == 1) printf("1");
		else printf("e");
	}*/
	
  write(1, buffer, sizeof(buffer));

  return(0);
}

