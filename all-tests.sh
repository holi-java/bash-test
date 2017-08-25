shunit2="shunit2-2.1.3"

# install shunit2 if needed
if [ ! -d "$shunit2" ]; then
  curl -L "http://downloads.sourceforge.net/shunit2/$shunit2.tgz" | tar zx
fi

# loading tests files
for test in `find test -name *.test.sh`; do
  echo "add test: $test"
  source $test
done

# search test names
tests=`declare -F | sed s/^declare' '-f' '// | grep ^test`

# add tests for shunit2
suite(){
  for test in $tests; do
    suite_addTest $test
  done
}

# run tests
source $shunit2/src/shell/shunit2
