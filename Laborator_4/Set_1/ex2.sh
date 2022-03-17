#!/bin/bash
clear

## Declararea "parametrilor" ##
declare -i nr1=$1
declare -i nr2=$2

### Algoritmul lui Euclid, recursiv cu scaderi ###

function euclid ()
{
    if (($1 != $2))
    then 
        if (($1 > $2)) ; then euclid $(($1 - $2)) "$2" ; fi
        if (($1 < $2)) ; then euclid "$1" $(($2 - $1)) ; fi
    else 
        echo "Cel mai mic divizor comun ai ($nr1) si ($nr2): $1"
    fi
}

## Verificare de argumente ##
if ! test "$1"
then
    read -p "Primul numar: " nr1
fi

if ! test "$2"
then 
    read -p "Al doilea numar: " nr2
fi

## Chemarea functiei euclid ##
euclid "$nr1" "$nr2"