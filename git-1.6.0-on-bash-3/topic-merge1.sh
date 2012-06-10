#!/bin/bash

source testenv.source
source git-setup.source

tst_checkComplainAndAdjustExpected 0

(

 mkdir local

 (
  cd local

  git init

  echo a >a
  git add a
  git commit a -m a

  git branch b
  git checkout b
  mkdir b
  git mv a b/a
  git commit . -m 'mv'

  COMMIT_MV=$(git --no-pager log | head -n1 | sed 's/^commit //')

  git checkout master
  echo b >a
  git commit a -m 'a => b'

  git checkout b

  git config user.name "Frank Schwidom"

  git merge -m 'merge' master

  tst_test test 'b' == $( cat b/a)

  git checkout master 

  tst_test test 'b' == $( cat a)
  
  git merge -m 'merge' b

  tst_test test 'b' == $( cat b/a)

  git revert --no-edit "$COMMIT_MV"

  tst_test test 'b' == $( cat a)

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 4

echo $(tst_result)

