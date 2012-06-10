module OperatorDollar where

 import TestEnv

 -- creating an $ like function
 
 f :: (a -> b) -> a -> b
 f g x = (g x)

 tests te =
  return te >>=
  checkComplainAndAdjustExpected 0 >>=

  test ( 5 == ($ 2) (+ 3)) >>=
  test ( 5 == (`f` 2) (+ 3)) >>=

  test ( 5 == (\x -> (($) x 2)) (+ 3)) >>=
  test ( 5 == (\x -> (f x 2)) (+ 3)) >>=

  checkComplainAndAdjustExpected 4 >>=
  return


