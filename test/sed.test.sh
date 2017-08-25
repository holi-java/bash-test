#! /bin/bash

test_replace_value_by_regex(){
  assertEquals 'jest' `echo test | sed s/^./j/`
}

test_append_text_to_stream(){
  expected="test"$'\n'"shell"

  assertEquals "$expected" "`echo test | sed 'a\shell'`"
}
