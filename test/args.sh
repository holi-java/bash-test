#!/bin/bash

if [ "$1" == "-f" ]; then echo $2;
elif [ "$1" == "-c" ]; then echo `expr $# - 1`;
elif [ "$1" == "-a" ]; then echo $@;
elif [ "$1" == "-n" ]; then echo $0;
elif [ "$1" == "-s" ]; then echo $?;
elif [ "$1" == "-e" ]; then export $2=$3;
else
  n=`expr $1 + 1`
  echo ${!n}
fi

