#!/bin/bash

test_parse_expression_with_no_spaces(){
  actual=`expr 2+3`

  assertEquals "2+3" $actual
}

test_parse_expression_with_spaces(){
  actual=`expr 2 + 3`

  assertEquals 5 $actual
}

test_parse_multiply_expression(){
  actual=`expr 2 \* 3`

  assertEquals 6 $actual
}

source ../$shunit2/src/shell/shunit2
