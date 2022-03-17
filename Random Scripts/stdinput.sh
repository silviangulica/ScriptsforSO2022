#!/bin/bash
# Introdu folosirea si lucrul cu variabile

# Comanda read poate citi variabila de la tastatura si il poti modifica pe parcurs
read -r -p "Dati un numar = " n
echo "Numarul dvs este: $n"

echo "Shell-ul cu care lucrez este $SHELL"