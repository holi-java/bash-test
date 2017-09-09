#!/bin/bash

test_sum_with_variables(){
  one=1; two=2;

  let sum=$one+$two

  assertEquals 3 $sum
}

test_sum_with_expression(){
  let "sum = 1 + 2"

  assertEquals 3 $sum
}

test_sum_with_expression2(){
  let sum="1 + 2"

  assertEquals 3 $sum
}

test_increment(){
  a=1
  
  let a++

  assertEquals 2 $a
}

test_decrement(){
  a=1
  
  let a--

  assertEquals 0 $a
}

test_multiply(){
  let "a = 3 * 5"

  assertEquals 15 $a
}

test_use_command_substitution(){
  assertEquals 3 "$(let a=1+2 && echo $a)"
}

source ../$shunit2/src/shell/shunit2
