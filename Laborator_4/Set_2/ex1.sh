#!/bin/bash
clear
## Testarea parametrilor ##
declare -i k=$1
declare -i d=$2
if ! test "$1"
then
    read -p "Numarul k: " k
fi

if ! test "$2"
then 
    read -p "Numarul d: " d
fi

declare -i suma=0
for i in $(seq "$k")
do 
    if (("$i" % "$d" != 0)) ; then continue ; fi
    suma+=$((i ** 2))
done

echo "Suma patratelor primelor K numere div cu D: ${suma}"
