#!/bin/bash

### Copy all the files from a director and move them to another dir ###
dirName=$1

if [ ! -d $1 -o ! -r $1 -a $# -eq 1 ] 
then
  read -p "[Err]: Numele directorului: " dirName
fi

backup=$dirName/backup_sh
if [ ! -d $backup ] ; then mkdir $backup ; fi 

for sursa in $(ls -R $dirName)
do
  if [[ $sursa == *".sh"* ]] 
  then
    fisier=$(find $dirName -name $sursa)
    cp $fisier $backup 
    sursa_sha=$(sha256sum $fisier)
    mv $backup/$sursa $backup/${sursa_sha% $fisier}   
  fi
done
