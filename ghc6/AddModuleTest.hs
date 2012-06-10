module AddModuleTest where

 import TestEnv

 tests te =

  return te >>=
  checkComplainAndAdjustExpected 0 >>=
  test True >>=
  checkComplainAndAdjustExpected 1 >>=
  return 

