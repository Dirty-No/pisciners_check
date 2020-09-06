#!/bin/sh

cat $1 | xargs -L1 ./pisciner_check.sh > SUCCESS 2> FAIL