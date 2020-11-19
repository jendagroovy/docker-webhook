#!/bin/sh
source $2
envsubst < $1 > `echo "$1" | sed s/.template\$//`
