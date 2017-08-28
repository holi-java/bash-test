#!/bin/bash

test_file_mime_type(){
  assertEquals "inode/directory" $(file --brief --mime-type $PWD)
  assertEquals "text/plain" $(file --brief --mime-type all-tests.sh)
  assertEquals "application/x-executable" $(file --brief --mime-type /bin/ls)
}
