#!/bin/sh

if [ $# -ne 1 ];
then
    echo "Invalid arguments"
    echo "Usage : ./check_list.sh login_list.txt"
    exit
fi

cat "$1" | xargs -L1 ./pisciner_check.sh > SUCCESS.txt 2> FAIL.txt &