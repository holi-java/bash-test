#!/bin/bash

test_empty(){
  assertFalse '[ ]'
}

test_not(){
  assertTrue '[ true ]'
  assertFalse '! [ true ]'
}

test_and(){
  assertTrue '[ true ] && [ true ]' 
  assertFalse '[ ] && [ true ]' 
  assertFalse '[ true ] && [ ]' 
  assertFalse '[ ] && [ ]' 
}

test_or(){
  assertTrue '[ true ] || [ true ]' 
  assertTrue '[ ] || [ true ]' 
  assertTrue '[ true ] || [ ]' 
  assertFalse '[ ] || [ ]' 
}

test_nested_and(){
  assertFalse '[ true && true ]' 
  assertFalse '[ true && false ]' 
  assertFalse '[ false && true ]' 
  assertFalse '[ false && false ]' 
}

test_nested_or(){
  assertTrue '[ true || true ]' 
  assertTrue '[ false || true ]' 

  assertFalse '[ true || false ]' 
  assertFalse '[ false || false ]' 
}
