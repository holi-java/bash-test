#!/bin/bash

test_get_string_length(){
  value="foo"

  assertEquals 3 ${#value}
}

test_get_number_length(){
  let value=12345

  assertEquals 5 ${#value}
}

source ../$shunit2/src/shell/shunit2
