#!/bin/bash

source testenv.source
source git-setup.source

tst_checkComplainAndAdjustExpected 0

(
 mkdir local

 (
  cd local

  git init

  echo init > init; git add init; git commit -m init init;

  echo 1 > a; git add a; git commit -m a a;
  echo 2 > a; git add a; git commit -m a a;
  echo 3 > a; git add a; git commit -m a a;
  echo 4 > a; git add a; git commit -m a a;
  echo 5 > a; git add a; git commit -m a a;
  echo 6 > a; git add a; git commit -m a a;
  echo 7 > a; git add a; git commit -m a a;
  echo 8 > a; git add a; git commit -m a a;
  echo 9 > a; git add a; git commit -m a a;
  
  tst_test test "9" == $( cat a)
  git checkout HEAD^
  tst_test test "8" == $( cat a)
  git checkout HEAD^
  tst_test test "7" == $( cat a)
  git checkout HEAD^
  tst_test test "6" == $( cat a)
  git checkout HEAD^
  tst_test test "5" == $( cat a)
  git checkout HEAD^
  tst_test test "4" == $( cat a)
  git checkout HEAD^
  tst_test test "3" == $( cat a)
  git checkout HEAD^
  tst_test test "2" == $( cat a)
  git checkout HEAD^
  tst_test test "1" == $( cat a)
  git checkout HEAD^
  tst_test test -f init
  tst_test test ! -f a
  tst_test test ! -d a.d
  git checkout master

  git filter-branch --tree-filter 'mkdir a.d; touch a.d/d; mv a a.d; true;'

  tst_test test "9" == $( cat a.d/a)
  git checkout HEAD^
  tst_test test "8" == $( cat a.d/a)
  git checkout HEAD^
  tst_test test "7" == $( cat a.d/a)
  git checkout HEAD^
  tst_test test "6" == $( cat a.d/a)
  git checkout HEAD^
  tst_test test "5" == $( cat a.d/a)
  git checkout HEAD^
  tst_test test "4" == $( cat a.d/a)
  git checkout HEAD^
  tst_test test "3" == $( cat a.d/a)
  git checkout HEAD^
  tst_test test "2" == $( cat a.d/a)
  git checkout HEAD^
  tst_test test "1" == $( cat a.d/a)
  git checkout HEAD^
  tst_test test -f init
  tst_test test ! -f a.d/a
  tst_test test -d a.d
  git checkout master

  #tst_test test "${COMMIT_5}" == $(git --no-pager log | head -n1 | sed 's/^commit //')

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 24

echo $(tst_result)

