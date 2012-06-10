#!/bin/bash

source testenv.source
source git-setup.source

tst_checkComplainAndAdjustExpected 0

(

 mkdir remote local

 (

  cd remote
  git init
  touch y
  git add y
  git commit -m "y"
 ) 

 (
 
  cd local
  git init
  touch x
  git add x
  git commit -m "x"

  git remote add -f remote-name ../remote # geht auch ohne
  # git fetch ../remote :new-branch-name

  tst_test test 'remote-name' == $( git remote)

  git checkout -b new-branch-name remote-name/master
  tst_test test -f y 
  tst_test test ! -f x 

  git checkout master
  tst_test test ! -f y 
  tst_test test -f x 

  git config user.name "Frank Schwidom"
  git merge new-branch-name

  tst_test test -f y 
  tst_test test -f x 

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 6

echo $(tst_result)

# see also : fetch-merge.sh remote-fetch-merge.sh
