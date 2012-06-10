module OperatorDot where

 import TestEnv

 -- creating an . like function
 
 f :: (b -> c) -> (a -> b) -> a -> c
 f g h x = (g (h x))

 tests te =
  return te >>=
  checkComplainAndAdjustExpected 0 >>=

  -- test True >>=
  test ( 9 == (f (3 *) (2 +) 1)) >>=
  test ( 9 == ((.) (3 *) (2 +) 1)) >>=

  test ( 9 == ((3 *) . (2 +)) 1) >>=
  test ( 8 == ((+ (- 1)) . (3 *) . (2 +)) 1) >>=

  checkComplainAndAdjustExpected 1 >>=
  return


