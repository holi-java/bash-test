#!/bin/bash

test_while_loop(){
  n=0
  out="$n"

  while [ $n -lt 3 ]; do
    let n++
    out="$out;$n"
  done

  assertEquals "0;1;2;3" "$out"
}

test_until_loop_is_negative_of_while_loop(){
  n=0
  out="$n"

  until ! [ $n -lt 3 ]; do
    let n++
    out="$out;$n"
  done

  assertEquals "0;1;2;3" "$out"
}
