#!/bin/bash

### Automatic testing a program in CPP ###
version="--version"
help="--help"
noremove=0

## Check if there is no args or more than 2
if [ $# -eq 0 ] || [ $# -gt 2 ]
then
	echo "[Err]: Use --help for information"
	exit 0
fi

## Check for the -e argument
if [ $1 = "-e" ] || [ $1 = "--exec" ]
then
	output_file="output"
	echo -e "[Compilation Finished!]"
	g++ -o $output_file *.cpp
	wait
	echo -e "[Running the output!]"
	./$output_file
	echo 
 	read -p "You want to delete the output? [Y/n]?: " answer
	if [ $answer = "y" ] ; then rm $output_file ; fi
	exit 0
fi

## Check for help arg
if [ $1 = $help ]
then
	echo -e "Help for autocpp.sh \n"
	echo "There is the main usage: "
	echo -e "autocpp.sh <args> or/and <output_name> "
	echo "Effect: It will run the output file from C/Cpp"
	echo "Note: You can use onyl 2 argument at a time"
	echo -e "\nThere is all the possible commands:\n"
	echo -e "\t -v, --version \t :use to show the version"
	echo -e "\t -n, --noremove  :use for not removing the output"
	echo -e "\t -e, --exec \t :use to compile all files from the current dir"
	echo -e "\n\nDeveloped by Gulica Silvian\n\n"
	exit 0
fi

## Check for version arg
if [ $1 = $version ] || [ $1 = "-v" ]
then
	echo  "Version 0.8"
	exit 0
fi

## Check for noremove arg
if [ $1 = "-n" ] || [ $1 = "-noremove" ]
then
	noremove=1
	shift
fi

## Run the script
sursa=$1
./$sursa

## Check if it is neded to remove
if [ $noremove -eq 0 ] ; then rm $sursa ; fi

exit 0 # Succes
