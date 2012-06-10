#!/bin/bash

source testenv.source
source git-setup.source

tst_checkComplainAndAdjustExpected 0

(

 mkdir local

 (
 
  cd local
  git init

  touch a
  git add a
  git commit -m "a"

  tst_test test -f a
  
  tst_test ! git revert --no-edit HEAD 

  tst_checkComplainAndAdjustExpected 2

  touch b
  git add b
  git commit -m "b"
  
  tst_test test -f b
  
  COMMIT_B1=$(git --no-pager log | head -n1 | sed 's/^commit //')

  tst_test git revert --no-edit HEAD 

  tst_test test ! -f b

  tst_test git revert --no-edit HEAD 

  tst_test test -f b

  tst_checkComplainAndAdjustExpected 5

  tst_test git revert --no-edit "$COMMIT_B1" 

  tst_test test ! -f b

  tst_test ! git revert --no-edit "$COMMIT_B1" 

  tst_test test ! -f b

  tst_checkComplainAndAdjustExpected 2

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 0

echo $(tst_result)

