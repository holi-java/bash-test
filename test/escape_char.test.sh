#!/bin/bash

tearDown(){
  shopt -u extglob
}

test_escape_char(){
  assertEquals 'a\b' "a\\b"
  assertEquals 'a"b' "a\"b"
  assertEquals 'a\nb' "a\nb"
}

test_escape_other_chars_are_preserved(){
  assertEquals 'a\ab' "a\ab"
}

test_new_line(){
  assertEquals "`printf 'a\nb'`" a$'\n'b
}

test_concat_multi_lines(){
  lines="one\
    two"

  shopt -s extglob
  assertEquals "one two" "${lines/+([ ])/ }"
}


source ../$shunit2/src/shell/shunit2
