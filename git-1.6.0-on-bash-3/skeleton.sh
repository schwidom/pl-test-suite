#!/bin/bash

source testenv.source
source git-setup.source

tst_checkComplainAndAdjustExpected 0

(
 mkdir local

 (
  cd local

  git init

  tst_test true
  tst_test ! false

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 2

echo $(tst_result)

