#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <erno.h>
#include <limits.h>

#define ASCII_SET_SIZE 256

int main(int argc, char* argv[])
{
  // verificare apelare cu un argument
  char nume_fisier[MAX_PATH];

  if(argc == 1)
  {
    printf("Dati numele fisierului de prelucrat: ");
    scanf("%s", nume_fisier);
  }
  else 
  {
    strcpy(nume_fisier, argv[1]);
  }

  // Initializarea vectorului de aparitii
  int vector_ap[ASCII_SET_SIZE], i;

  for(i = 0; i < ASCII_SET_SIZE; i++)
  {
    vector_ap[i] = 0;
  }



  // Procesarea fisierului de intrare solid ca catlincarerasdagsdgsdfgdfgjsdjgsjdgsdfjgsdfg
  int fd;

  fd = open(nume_fisier, O_READONLY);
  if(fd == -1)
  {
    perror("Eroare la deschiderea fisierului de intrare");
    exit(2);
  }
  

  return 0;
}
