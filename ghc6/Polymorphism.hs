module Polymorphism where

 import TestEnv

 f [1] = [9]
 f [2] = [10]
 f (x:xs) = xs ++ [x]
 f _ = [99]

 g 1 1 = 1
 g _ 2 = 2
 g 2 _ = 3
 g _ _ = 4

 tests te =
  return te >>=
  checkComplainAndAdjustExpected 0 >>=

  test ( [9] == f [1]) >>=
  test ( [10] == f [2]) >>=
  test ( [3] == f [3]) >>=
  test ( [2, 3, 1] == f [1, 2, 3]) >>=
  test ( [99] == f []) >>=

  checkComplainAndAdjustExpected 5 >>=

  test ( (1 == g 1 1)) >>=
  test ( (2 == g 5 2)) >>=
  test ( (3 == g 2 6)) >>=
  test ( (4 == g 8 9)) >>=

  checkComplainAndAdjustExpected 4 >>=
  return

