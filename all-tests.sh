export shunit2="shunit2-2.1.3"

# install shunit2 if needed
if [ ! -d "$shunit2" ]; then
  curl -L "http://downloads.sourceforge.net/shunit2/$shunit2.tgz" | tar zx
fi

# run all tests
tests=`find test -name *.test.sh`
cd test
for test in $tests; do
  echo "run test: $test"
  bash ${test#**/}
  stat=$?
  if [ $stat != 0 ]; then exit $stat; fi
done

