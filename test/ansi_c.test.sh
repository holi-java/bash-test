test_ansi_c(){
  newline=$'\n'

  assertSame `printf '\a'` $'\a'
  assertSame "`printf "a\nb"`" "a${newline}b"
}


source ../$shunit2/src/shell/shunit2
