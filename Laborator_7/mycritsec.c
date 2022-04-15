#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <limits.h>

int main(int argc, char* argv[])
{
  // Verificare fisier
  char nume_fisier_procesat[PATH_MAX];
  char nume_fisier_comenzi[PATH_MAX];


  // Citirea primul fisier, fisier de procesat
  if (argc == 1)
  {
      printf("Introduceti numele fisierului ce se va citi/procesa: ");
      scanf("%s", nume_fisier_procesat);
  }
  else
  {
      strcpy(nume_fisier_procesat, argv[1]);
  }


  // Citirea fisierului cu comenzi
  printf("Introduceti numele fisierului ce contine comenzi: ");
  scanf("%s", nume_fisier_comenzi);


  // Deschiderea fisierului de procesat
  int f_procesat;
  if (-1 == (f_procesat = open(nume_fisier_procesat, O_RDWR)))
  {
    perror("Eroare la deschiderea fisierului de procesat");
    exit(1);
  }


  // Deschiderea fisierului cu comenzi
  int f_comenzi;
  if (-1 == (f_comenzi = open(nume_fisier_comenzi, O_RDONLY)))
  {
    perror("Eroare la deschiderea fisierului de comenzi.");
    exit(2);
  }

  // Bucla de procesare, ce sare peste o valoare in cautarea prin fisierul procesat.
  int cheie, alter, r_cheie, r_alter;
  int OK = 1;

  int pcheie, palter, r_pcheie, r_palter;
  while(1)
  {
    // Verificare citire din FISIER COMENZI 
    if (-1 == (r_cheie = read(f_comenzi, &cheie, sizeof(int)))) exit(3);
    if (-1 == (r_alter = read(f_comenzi, &alter, sizeof(int)))) exit(4);
    if (r_alter == 0) break;
    
    // Cautare in fisier de procesat 
    while(1)
    {
      if (OK == 1)
      {
        if (-1 == (r_pcheie = read(f_procesat, &pcheie, sizeof(int)))) exit(5);
        if (-1 == (r_palter = read(f_procesat, &palter, sizeof(int)))) exit(6);
        if (r_palter == 0) break;
        
        int modificat = palter + alter;
        if(cheie == pcheie)
        {
            write(f_procesat, &modificat, sizeof(int));
        }

        // Verificare pentru valoare de cheie.
        OK = 0;
      } else OK = 1;
    }
  }
  close(f_procesat);
  close(f_comenzi);
  return 0;
}
