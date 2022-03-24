#!/bin/bash

function power()
{
    if (($1 == 0))
    then 
        echo "1"
        return
    else 
       echo $((3 * $(power $(($1-1))))) 
    fi
}

declare -i n=$1
if ! test "$1"
then 
    read -r -p "Numarul N: " n
fi

for i in $(seq "$n")
do
    echo "$(power $i)" >&2
done

