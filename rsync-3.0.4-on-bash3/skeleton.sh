#!/bin/bash

source testenv.source
source rsync-setup.source

tst_checkComplainAndAdjustExpected 0

(
 tst_test true
 tst_test ! false

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 2

echo $(tst_result)

