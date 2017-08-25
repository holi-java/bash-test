#!/bin/bash

test_compare_strings_by_test_command(){
  assertEquals true "`test "foo" == "foo" && echo true`"
  assertEquals "" "`test "foo" == "bar" && echo true`"
}

test_compare_numbers_by_test_command(){
  assertEquals true "`test 1 == 1 && echo true`"
  assertEquals "" "`test 1 == 2 && echo true`"
}

test_file_exists_by_test_command(){
  file="test-$RANDOM"

  assertFalse "file exists" $(test -f $file && echo true)

  touch $file
  assertTrue "file doesn't exists" $(test -f $file && echo true)

  rm $file
}
