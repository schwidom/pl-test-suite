module TopicLists where

 import TestEnv

 tests te =
  return te >>=
  checkComplainAndAdjustExpected 0 >>=


  test ( [ 1, 2, 3] == [1..3]) >>=

  test ( [ 0.0, 0.75, 1.5, 2.25] == [0, 0.75 .. 2]) >>=

  test ( "acegikmoq" == ['a','c' .. 'r']) >>=

  test ( 1 == head [1]) >>=
  test ( [] == tail [1]) >>=

  test ([1, 2, 3] == [ x | x <- [1, 2, 3]]) >>=
  test ([[1,3],[1,4],[2,3],[2,4]] == [ [x, y] | x <- [1, 2], y <- [3, 4]]) >>=
  test ([[1,3],[2,4]] == [ [x, y] | x <- [1, 2], y <- [3, 4], (x+ 2) == y]) >>=

  checkComplainAndAdjustExpected 8 >>=
  return


