module KeywordDeriving where

 import TestEnv

 data X = A String Int | B Int String
  deriving ( Eq, Ord) -- supports: Eq Ord Enum Bounded Show Read

 data D = Y { a :: Int, b :: Int }
  deriving ( Eq, Ord) -- supports: Eq Ord Enum Bounded Show Read

 tests te =

  return te >>=
  checkComplainAndAdjustExpected 0 >>=

  test ((A "a" 1) == (A "a" 1)) >>=
  test ((A "a" 1) < (A "a" 2)) >>=
  test ((A "a" 1) < (A "b" 1)) >>=

  test ((A "a" 2) < (A "b" 1)) >>= -- depends on the execution sequence

  test ((A "a" 1) < (B 1 "a")) >>= -- depends on the execution sequence

  checkComplainAndAdjustExpected 5 >>=

  test ((Y 1 1) == (Y 1 1)) >>=
  test ((Y 1 1) < (Y 1 2)) >>=
  test ((Y 1 1) < (Y 2 1)) >>=

  test ((Y 1 2) < (Y 2 1)) >>= -- depends on the execution sequence

  checkComplainAndAdjustExpected 4 >>=
  return


