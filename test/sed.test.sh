#! /bin/sh

test_replace_result_with_regex(){
  assertEquals 'jest' `echo test | sed s/^./j/`
}


