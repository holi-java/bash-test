#!/bin/bash

test_regular_if_statement(){
  if [ true ]
  then
    assertTrue true
    return
  fi

  fail
}

test_if_then_by_use_semi_separator(){
  if [ true ]; then 
    assertTrue true
    return
  fi

  fail
}

test_infline_if_then_fi(){
  if [ true ]; then assertTrue true; return; fi

  fail
}

test_if_check_empty_string_only(){
  if ! [ true ]; then fail "fail with 'true'"; fi
  if ! [ false ]; then fail "fail with 'false'"; fi

  if ! [ "" ]; then 
    assertTrue true
  else
    fail "fail with empty string" 
  fi
}

test_check_directory_exists(){
  mkdir .test
  if ! [ -d ".test" ]; then fail "/.test doesn't exists"; fi

  rm .test -rf
  if [ -d ".test" ]; then fail "/.test exists"; fi
}

test_check_file_exists(){
  touch .test
  if ! [ -f ".test" ]; then fail ".test doesn't exists"; fi

  rm .test 
  if [ -f ".test" ]; then fail ".test exists"; fi
}

test_if_elseif_else_expression(){
  assertEquals "one" `value 1`
  assertEquals "two" `value 2`
  assertEquals "many" `value 3`
}

value(){
  if [ $1 == 1 ]; then
    echo one
  elif [ $1 == 2 ]; then
    echo two
  else
    echo many
  fi
}
