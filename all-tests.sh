shunit2="shunit2-2.1.3"

if [ ! -d "$shunit2" ]; then
  curl -L "http://downloads.sourceforge.net/shunit2/$shunit2.tgz" | tar zx
fi

# loading tests files
for test in `find test -name *.test.sh`; do
  source $test
done

# search test names
tests=`declare -F | sed s/^declare' '-f' '// | grep ^test`

suite(){
  for test in $tests; do
    echo "add test: $test"
    suite_addTest $test
  done
}

source $shunit2/src/shell/shunit2
