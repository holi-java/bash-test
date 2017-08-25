#!/bin/bash

case $1 in
  -f) echo $2;;
  -c) echo $(($# - 1));;
  -a) echo $@;;
  -n) echo $0;;
  -s) echo $?;;
  -e) export $2=$3;;
  *)
    n=`expr $1 + 1`
    echo ${!n}
  ;;
esac
