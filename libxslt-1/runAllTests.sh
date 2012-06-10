#!/bin/bash

for i in element--*.sh; do lib/test.sh $i; done

for i in axes--*.sh; do lib/test.sh $i; done

for i in code--*; do
(
 cd $i
 echo ${PWD/$OLDPWD/}
 ./runAllTests.sh
)
done

