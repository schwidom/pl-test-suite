#!/bin/bash

TD="../testdata"

# kann sein, dass die output-datei auch mit ins current-result / expected-result verzeichniss muss

echo test1 &&
#./run test 0 ${TD}/test1.txt ${TD}/test1-output.txt test-output:true &&
./run test 0 ${TD}/test1.txt ${TD}/test1-output.txt test-output:true >${TD}/current-result/test1-result.txt &&

echo test2 &&
./run test 0 ${TD}/test2.txt ${TD}/test2-output.txt test-output:true >${TD}/current-result/test2-result.txt &&

echo test3 &&
./run test 0 ${TD}/test3.txt ${TD}/test3-output.txt test-output:true >${TD}/current-result/test3-result.txt &&

echo test4 &&
./run test 0 ${TD}/test4.txt ${TD}/test4-output.txt test-output:true >${TD}/current-result/test4-result.txt &&

#echo test5 &&
#./run test 0 ${TD}/test5.txt ${TD}/test5-output.txt test-output:true >${TD}/current-result/test5-result.txt &&

diff ${TD}/current-result/test1-result.txt ${TD}/current-result/test4-result.txt &&
diff -x '.svn' -r ${TD}/expected-result ${TD}/current-result && 
#diff -x '.svn' --brief -r ${TD}/expected-result ${TD}/current-result && 
echo ok 

