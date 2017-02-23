#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int fetch(unsigned long,char *);
int
main( void )
{
    char *str = malloc(sizeof(char)*13);
    long index[3] = {0x80000002,0x80000003,0x80000004};
    int i = 0;

    printf("%p\n",str);
    for(;i<3;i++)
    {
        fetch(index[i],str);
        printf("%s",str);
    }

    printf("\n");
    return 0;
}
