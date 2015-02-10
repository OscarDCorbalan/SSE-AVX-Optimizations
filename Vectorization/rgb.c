/*
*	Change G channel of a RGB to green
*/
#include <stdio.h>
#include <stdlib.h>


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

  for ( j=0 ; j<ROWS; j++)
  {
    for ( i=0 ; i<COLUMNS; i++)
    { 
       buffer[j][i].r = 0;
       buffer[j][i].g = 1;
       buffer[j][i].b = 0;
    }
  }
}

int main(int argc, char *argv[])
{
  rgb_verd();
	/*int i; 
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

