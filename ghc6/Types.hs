module Types where

 import TestEnv

 tests te =
  return te >>=
  checkComplainAndAdjustExpected 0 >>=
  test ( 1.0 == asTypeOf 1 2.0) >>=
  checkComplainAndAdjustExpected 1 >>=
  return

