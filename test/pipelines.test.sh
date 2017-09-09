#!/bin/bash

test_operate_between_multi_commands(){
  words="$(echo "foo bar baz" | wc -w)"
  words2="$(echo "foo bar baz" |& wc -w)"

  assertEquals 3 $words
  assertEquals 3 $words2
}

test_pipeline_status(){
  false && assertEquals 1 $?
  true && assertEquals 0 $?

  false | true && assertEquals 0 $?
  true  | false && assertEquals 1 $?

  !(false | true) && assertEquals 1 $?
  !(true  | false) && assertEquals 0 $?
}

test_redirect_stderr_to_stdout(){
  assertTrue "[[ '`echo $(eval '${xxx}')`' == '' ]]"
  assertTrue "[[ '`echo $(eval '${xxx}' 2>&1)`' == *'xxx'* ]]"
}

source ../$shunit2/src/shell/shunit2
