#!/bin/bash
v=10
clear
# Decrementarea, adunarea, mariea, toate cu let
echo "Variabila initial este $v"

let v=v-1
echo "Decrementarea variabilei: $v"

let v+=10
echo "Marirea variabilei cu valoarea 10: $v"

let "v += 2 ** 3" # Adunam la v 2 la puterea 3
echo "Marirea variabilei cu valoarea 2^3: $v"


# Ale operatii cu valoarea lui expr
expr 1 + 2 \* 3 # <- Se va afisa valoarea expresiei

v=`expr $v - 1`
echo "Valoarea lui v la moment: $v"

v=$(expr $v + 10)
echo "Valoarea lui v la moment: $v"

declare -i n
n=3+3

echo "Variabila $n"

echo 11 / 7 | bc -l