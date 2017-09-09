#!/bin/bash

test_case_statement(){
  assertEquals one $(count 1)
  assertEquals two $(count 2)
  assertEquals many $(count 3)
}

count(){
  case $1 in
    1) echo one;;
    2) echo two;;
    *) echo many;;
  esac
}

source ../$shunit2/src/shell/shunit2
