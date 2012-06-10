#!/bin/bash

source testenv.source
source rsync-setup.source

tst_checkComplainAndAdjustExpected 0

(
# tst_test true
# tst_test ! false

 mkdir -p src/{a,b}/{a,b}
 touch src/{a,b}/{a,b}/d

 {
  rm -rf dst

  rsync -r src/. dst

  tst_test test -f dst/a/a/d
  tst_test test -f dst/a/b/d
  tst_test test -f dst/b/b/d
  tst_test test -f dst/b/a/d
 }

 {
  rm -rf dst

  rsync -r --exclude='a' src/. dst

  tst_test test ! -f dst/a/a/d
  tst_test test ! -f dst/a/b/d
  tst_test test -f dst/b/b/d
  tst_test test ! -f dst/b/a/d
 }

 {
  rm -rf dst

  rsync -r --exclude='a' --include='a' src/. dst

  tst_test test ! -f dst/a/a/d
  tst_test test ! -f dst/a/b/d
  tst_test test -f dst/b/b/d
  tst_test test ! -f dst/b/a/d
 }

 {
  rm -rf dst

  rsync -r --include='a' --exclude='a' src/. dst

  tst_test test -f dst/a/a/d
  tst_test test -f dst/a/b/d
  tst_test test -f dst/b/b/d
  tst_test test -f dst/b/a/d
 }

 {
  rm -rf dst

  rsync -r --include='a/b' --include='b/a' --exclude='a' src/. dst

  tst_test test ! -f dst/a/a/d
  tst_test test ! -f dst/a/b/d
  tst_test test -f dst/b/b/d
  tst_test test -f dst/b/a/d
 } # uncool

 {
  rm -rf dst

  rsync -r --include='a/b' --exclude='a' src/. dst

  tst_test test ! -f dst/a/a/d
  tst_test test ! -f dst/a/b/d
  tst_test test -f dst/b/b/d
  tst_test test ! -f dst/b/a/d
 } # uncool

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 24

echo $(tst_result)

