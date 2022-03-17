#!/bin/bash
echo "Positional parameters are: "'$1' = $1, '$2' = $2
echo "The parameter '$0' = $0"
ps -o user,pid,ppid,cmd