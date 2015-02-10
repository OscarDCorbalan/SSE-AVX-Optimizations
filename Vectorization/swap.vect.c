/*
* Optimized swap.c via SSE
*/
#include <assert.h>
#include <emmintrin.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>

#define m 0xFF00FF00
#define o 0x00FF00FF
#define SS 10240

void panic(char *miss)
{
        if (errno != 0) perror(miss);
        else fprintf(stderr, "%s\n", miss);
        exit(1);
}
 
int main(int argc, char *argv[])
{
   unsigned char bufr[SS+15];
   __m128i __attribute__((__aligned__(16))) b1,b2;
	__m128i __attribute__((__aligned__(16))) mask = _mm_set_epi32(m,m,m,m);
	__m128i __attribute__((__aligned__(16))) mask2 = _mm_set_epi32(o,o,o,o);
   __m128i* pr = (__m128i *)(((uintptr_t)bufr) & ~0x0F);
	__m128i* pr2 = (__m128i *)(((uintptr_t)bufr) & ~0x0F);
	unsigned int n3;
	short n1=0;
	
		while ((n1=read(0, pr2, SS)) > 0){
			n3 = n1+(unsigned int)pr2;
			for(pr = pr2;(unsigned int)pr<n3;pr++){
				b1 = b2 = _mm_load_si128(pr);
				b2 = _mm_slli_si128(b2,1);
				b1 = _mm_srli_si128(b1,1);			
				b2 = _mm_and_si128(b2, mask);
				b1 = _mm_and_si128(b1, mask2);
				b2 = _mm_or_si128(b2,b1);
				_mm_store_si128(pr,b2);
			}		
			write(1, pr2, n1);
		}
		if (n1>0) write(1, pr2, n1);

    return 0;
}
