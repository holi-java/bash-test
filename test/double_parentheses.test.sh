#!/bin/bash

test_parse_expression_with_no_spaces_by_double_parentheses(){
  assertEquals 3 $((1+2))
}

test_double_parentheses_expression_assign_to_a_variable(){
  five=$((3+2))

  assertEquals 5 $five
}

test_plus_assign_expression(){
  a=2
  
  (( a+=1 ))

  assertEquals 3 $a
}
