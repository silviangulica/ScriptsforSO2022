#!/bin/bash
clear
world=1234
echo -e \\n"Variabila intreaga: "$world 		                # Afisam variabila
echo -e "Lungimea variabila: "${#world}      	                # Afisam lungimea variabilii		
echo -e "Variabila de pe 1, o pozitie: "${world:1:1} 		    # Afisam textul variabilii de la poz 1, o casuta
echo -e "Restul variabilii de la poz 2:"${world:2} \\n  		# Afisam textul variabilii de la poz 2

# Apeland echo deja se realizeaza \n
# Pentru a folosi \n in bash, trebuie sa folosim \\n

# Folosim ceea ce este mai jos pentru a sterge!

echo "Eliminarea prefixului din variabila: "${world#12}
echo "Eliminarea sufixului din variabila: "${world%34}

# Cel mai lung si cel mai scurt prefix care se potriveste pe sablon

sir=AbcAbcAbcAbcDEF

echo "Variabila: "$sir
echo "Cel mai scurt prefix A*c: "${sir#A*c}
echo "Cel mai lung prefix A*c: "${sir##A*c}
echo "Cel mai scurt sufix D*F: "${sir%D*F}
echo -e "Cel mai lung sufix D*: "${sir%%D*} \\n

# Exemplu cu denumire de fisiere

fisier=/home/silvian/Scripts/

dirname $fisier 
basename $fisier