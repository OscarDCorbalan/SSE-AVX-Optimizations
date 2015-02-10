/*
* Optimized swap.c via AVX
*/
#include <assert.h>
#include <emmintrin.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdint.h>
#include <avxintrin.h>

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
	__m256i __attribute__((__aligned__(32))) b1,b2;
	__m256i __attribute__((__aligned__(32))) mask = _mm256_set1_epi32(m);
	__m256i __attribute__((__aligned__(32))) mask2 = _mm256_set1_epi32(o);
	__m256i* pr = (__m256i *)(((uintptr_t)bufr) & ~0x0F);
	__m256i* pr2 = (__m256i *)(((uintptr_t)bufr) & ~0x0F);
	unsigned int n3;
	short n1=0;
	
		while ((n1=read(0, pr2, SS)) > 0){
			n3 = n1+(unsigned int)pr2;
			for(pr = pr2;(unsigned int)pr<n3;pr++){
				b1 = b2 = _mm256_load_si256(pr);
				b2 = _mm256_slli_si(b2,1);
				b1 = _mm256_srli_si256(b1,1);			
				b2 = _mm256_and_si256(b2, mask);
				b1 = _mm256_and_si256(b1, mask2);
				b2 = _mm256_or_si256(b2,b1);
				_mm256_store_si256(pr,b2);
			}		
			write(1, pr2, n1);
		}
		if (n1>0) write(1, pr2, n1);

    return 0;
}
