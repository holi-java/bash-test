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

test_for_loop_in_a_list(){
  words=$(echo hello+world | grep -Eo "\w+")
  out=""

  for word in $words; do
    out="$out;$word"
  done

  assertEquals ";hello;world" "$out"
}

test_breaking_loop(){
  n=0
  out="$n"

  while [ true ]; do
    if ! [ $n -lt 3 ]; then break; fi

    let n++
    out="$out;$n"
  done

  assertEquals "0;1;2;3" "$out"
}

test_continue_loop(){
  n=0
  out="$n"

  while [ $n -lt 3 ]; do
    let n++
    let even="$n % 2"
    
    if [ $even == 0 ]; then continue; fi

    out="$out;$n"
  done

  assertEquals "0;1;3" "$out"
}

source ../$shunit2/src/shell/shunit2
