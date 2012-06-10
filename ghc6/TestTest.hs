module TestTest where

 import TestEnv

 tests te =
  return te >>=
  checkComplainAndAdjustExpected 0 >>=
  test True >>=
  test True >>=
  checkComplainAndAdjustExpected 2 >>=
  test True >>=
  test True >>=
  test True >>=
  checkComplainAndAdjustExpected 3 >>=
  return

