#!/bin/bash

test_if(){
  if [ true ]; then 
    assertTrue true
    return
  fi
  fail "should can't be reach"
}

test_if_else(){
  if [ true ]; then 
    assertTrue true
  else
    fail "should can't be reach"
  fi
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
