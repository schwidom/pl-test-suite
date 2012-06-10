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

  git tag A1

  tst_test test "(refs/tags/A1, refs/heads/master)" == "$(git log --decorate | head -n1 | sed 's/^commit \S\+ //')"

  tst_test test -f .git/refs/tags/A1

  git tag A2

  tst_test test "(refs/tags/A2, refs/tags/A1, refs/heads/master)" == "$(git log --decorate | head -n1 | sed 's/^commit \S\+ //')"

  tst_test test -f .git/refs/tags/A2

  echo b >b
  git add b
  git commit b -m b

  git tag B

  tst_test test -f .git/refs/tags/B

  tst_test test "(refs/tags/B, refs/heads/master)" == "$(git log --decorate | head -n1 | sed 's/^commit \S\+ //')"

  git checkout A1 --

  tst_test test ! -f b 

  git checkout B --

  tst_test test -f b 

  git checkout A2 --

  tst_test test ! -f b 

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 9

echo $(tst_result)

