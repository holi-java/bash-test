#! /bin/bash

test_replace_value_by_regex(){
  assertEquals 'jest' `echo test | sed s/^./j/`
}

test_replace_selected_text(){
  assertEquals 'x' `echo test | sed c\x`
}

test_append_text_to_stream(){
  expected="test"$'
'"shell"

  assertEquals "$expected" "`echo test | sed 'a\shell'`"
}

test_insert_text_to_stream(){
  expected="shell"$'
'"test"

  assertEquals "$expected" "`echo test | sed 'i\shell'`"
}

test_transform_source_stream_to_target_stream(){
  expected="zesz"

  assertEquals "$expected" "`echo test | sed 'y/t/z/'`"
}

source ../$shunit2/src/shell/shunit2
