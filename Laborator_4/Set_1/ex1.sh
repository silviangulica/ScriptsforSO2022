#!/bin/bash
clear
### Interative math ###

function params ()
{
    read -r -p "Dati numarul P: " p
    for i in "$@"
    do
        if test $i \> $p ; then continue ; fi
        temp=$((i ** 3))
        echo "Valoarea din sir[$i]: $temp"
    done
}

### The usage of command should be like: s4_ex1 [numbers]
declare -a vector
declare -i n=$#

## For test if there is no args
if test $# -eq 0
then
    read -r -p "Numarul de numere: " n
    for i in $(seq 1 "$n")
    do
        read -r -p "$i numar: " "vector[i]"
    done
    params "${vector[@]}"
else 
    params "$@"
fi