#/bin/bash

setUp(){
  unset unknown
  foo="bar"
  bar="!baz"
  baz="Oooo"
  string=abcdefg
  array[0]=$string
  array[1]='2'
  array[2]='3'
  array[3]='4'
}

test_substitute_parameter_with_variable(){
  assertEquals 'bar' ${foo}
}

test_use_the_value_of_parameter_as_the_name_for_substituation_by_indirect_expansion(){
  assertEquals '!baz' ${!foo}
}

test_get_variable_with_default_value(){
  assertEquals 'bar' "${foo:-word}"
  assertEquals 'word' "${unknown:-word}"
  assertEquals "'word'" "${unknown:-'word'}"
  assertEquals '' "${unknown:-}"
}

test_assign_variable_with_default_value(){
  assertEquals 'bar' "${foo:=word}" 
  assertEquals 'word' "${unknown:="word"}" 
  assertEquals 'word' "${unknown:-}"
}

test_write_msg_to_stderr_if_parameter_absent(){
  assertEquals 'bar' `echo ${foo:?word} 2>&1`

  bar="`echo ${unknown:?bar} 2>&1`"
  assertEquals 'absent' ${bar:-absent}
  assertEquals '' "${unknown:-}"
}

test_substitute_with_word_if_parameter_present(){
  assertEquals 'word' "${foo:+word}" 
  assertEquals '' "${unknown:+word}" 
  assertEquals '' "${unknown:-}"
}

test_substring(){
  assertEquals $string "${string:0}"
  assertEquals 'cdefg' "${string:2}"
  assertEquals '' "${string:0:0}"
  assertEquals 'a' "${string:0:1}"
  assertEquals 'abcdef' "${string:0:-1}"
  assertEquals '' "${string:0:-7}"

  assertEquals 'abcdefg' "${string:-3}"
  assertEquals 'cdefg' "${string: -5}"
  assertEquals '' "${string: -5:0}"
  assertEquals 'cd' "${string: -5:2}"
  assertEquals 'cde' "${string: -5:-2}"
}

test_substring_array_item(){
  assertEquals 'cdefg' ${array[0]:2}
  assertEquals 'cde' ${array[0]:2:-2}
  assertEquals 'cd' ${array[0]: -5:2}
}

test_takeN_positional_parameters(){
  set -- 1 2 3 4 5 6 7

  assertEquals '3' "${@:3}"
  assertEquals '3' `echo ${@:3}`
  assertEquals '3 4 5 6 7' "`echo ${@:3}`"
  assertEquals '3 4' "`echo ${@:3:2}`"
  assertEquals '' "`echo ${@:3:-2}`"
  assertEquals '3 4 5 6 7' "`echo ${@: -5}`"
  assertEquals '3 4' "`echo ${@: -5:2}`"
}

test_take_items_from_array(){
  assertEquals "abcdefg" ${array[@]:0}

  assertEquals "abcdefg 2 3 4" "`echo ${array[@]:0}`"
  assertEquals "abcdefg 2 3 4" "`echo ${array[*]:0}`"

  assertEquals "2 3" "`echo ${array[@]: -3:2}`"
  assertEquals "" "`echo ${array[@]: -3:-2}`"
}

test_get_all_of_the_variable_names_starts_with_prefix(){
  test_1=; test_2=; test_3=;

  assertEquals 'test_1 test_2 test_3' "${!test_*}"
  assertEquals 'test_1 test_2 test_3' "`echo ${!test_@}`"
}

test_get_array_indices(){
  assertEquals '0 1 2 3' "${!array[*]}"
  assertEquals '0 1 2 3' "`echo ${!array[@]}`"
}

test_get_content_length(){
  assertEquals 3 ${#foo}
  assertEquals 4 ${#baz}

  assertEquals 7 ${#array}
  assertEquals 7 ${#array[0]}
  assertEquals 1 ${#array[3]}
  assertEquals 0 ${#array[4]}

  set -- 12 234 4567
  assertEquals 3 ${#@}
  assertEquals 3 ${#*}
  assertEquals 2 ${#1}
  assertEquals 4 ${#3}
}

test_deletes_matched_prefix(){
  file="usr/bin/foo"

  assertEquals "bin/foo" ${file#*/}
  assertEquals "foo" ${file##*/}
}

test_deletes_matched_suffix(){
  file="usr/bin/foo"

  assertEquals "usr/bin" ${file%/*}
  assertEquals "usr" ${file%%/*}
}

test_replace_long_matched_pattern_with_string(){
  file="usr/bin/foo"

  assertEquals "sbin/foo" ${file/*\//sbin/}
  assertEquals "sbin/foo" ${file/#*\//sbin/}
  assertEquals "usr/bar" ${file/%\/*//bar}
  assertEquals $file ${file/mismatched/sbin/}
}

test_makes_matched_pattern_to_lower_case(){
  file="USR/BIN/FOO"

  assertEquals "uSR/BIN/FOO" ${file,*}
  assertEquals "usr/bin/foo" ${file,,*}
}

test_makes_matched_pattern_to_upper_case(){
  file="usr/bin/foo"

  assertEquals "Usr/bin/foo" ${file^*}
  assertEquals "USR/BIN/FOO" ${file^^*}
}

todo_test_operators(){
  assertEquals '"foo"' "eval '${foo@Q}'"
}


source ../$shunit2/src/shell/shunit2
