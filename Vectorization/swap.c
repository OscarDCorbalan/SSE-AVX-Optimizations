/*
*	interchange the bytes comming from the standard input:
*	if the input data is abcd, the output should be badc.
*/
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
 
void panic(char *miss)
{
        if (errno != 0) perror(miss);
        else fprintf(stderr, "%s\n", miss);
 
        exit(1);
}
 
int main(int argc, char *argv[])
{
    char c1, c2;
    int n1, n2, ii;
	 
    while (((n1=read(0, &c1, 1)) > 0) && ((n2=read(0, &c2, 1)) > 0))
    {
		 
        if (write(1, &c2, 1) < 0) panic("write1");
        if (write(1, &c1, 1) < 0) panic("write2");
    }
 
    if ((n1==-1) || (n2==-1)) panic("read");
    if ((n1==1) && (n2==0))
            if (write(1, &c1, 1) < 0) panic("write");
 
    return 0;
}
