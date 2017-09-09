setUp(){
  literal='b ` \ $'
  foo="bar"
}

test_single_quote_as_literal(){
  assertNotSame $literal '$literal'
  assertSame "b \` \\ \$" "$literal"
}

test_can_not_use_nested_single_quotes(){
  eval "'\\''"
  assertEquals 1 $?
}

test_double_quotes(){
  assertSame 'bar' "$foo"
  assertSame 'bar' "`echo $foo`"
  assertSame '\' "\\"
}


source ../$shunit2/src/shell/shunit2
