#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>

extern int errno;

int main(int argc, char *argv[])
{
    char bufin[512], bufout[600];
    int i, m, in, out;
    char *pin, *pout;

    if (argc != 3)
    {
        printf("\nUsage: %s file[dos] outfile\n\n", argv[0]);
        exit(1);
    }
    in=open(argv[1], O_RDONLY);
    printf("Outputfile: %s \n", argv[2]);
    out=creat(argv[2], O_WRONLY | 0644);

    while ((m=read(in, bufin, 512)) != 0)
    {
        pin=bufin;
        pout=bufout;
        for(i=0; i < m; i++)
        {
            if (*pin != '\015')
            {
                *pout = *pin;
                pout++;
            }
        }
        *pout = '\0';
        i=write(out, bufout, strlen(bufout));
        if (i == -1)
        {
            printf("errno = %d ->", errno);
            perror(0);
        }
            

    }
    return 0;
}