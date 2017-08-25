#!/bin/bash

if [ "$1" == "-f" ]; then echo $2 && exit; fi
if [ "$1" == "-c" ]; then echo `expr $# - 1` && exit; fi
if [ "$1" == "-a" ]; then echo $@ && exit; fi
if [ "$1" == "-n" ]; then echo $0 && exit; fi
if [ "$1" == "-s" ]; then echo $? && exit; fi
if [ "$1" == "-e" ]; then
  export $2=$3
else
  n=`expr $1 + 1`
  echo ${!n}
fi

