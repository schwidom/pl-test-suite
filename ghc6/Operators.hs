module Operators where

 import TestEnv

 tests te =

  return te >>=
  checkComplainAndAdjustExpected 0 >>=

  test True >>=
  test (id True) >>=
  test (not False) >>=

  checkComplainAndAdjustExpected 3 >>=

  test (1 == 1) >>=

  (test $ (==) 1 1) >>=
  (test $ 1 == 1) >>=
  test (($ 1) (== 1)) >>=
  test (($ 1) (1 ==)) >>=

  test ((==) 1 1) >>=
  test (3 == 1 + 2) >>=
  test (3 == (+) 1 2) >>=
  test ((==) 3 (1 + 2)) >>=
  test ((==) 3 ((+) 1 2)) >>=
  test ((==) 6 (foldr (+) 0 [1, 2, 3])) >>=
  test ((==) 6 (foldl (+) 0 [1, 2, 3])) >>=

  checkComplainAndAdjustExpected 12 >>=

  test ("abc" == "abc") >>=
  test ("abc" == "ab" ++ "c") >>=
  test ("abc" == "a" ++ "b" ++ "c") >>=
  test ("abc" == (foldr (++) "" ["a", "b", "c"])) >>=
  test ("abc" == (foldl (++) "" ["a", "b", "c"])) >>=
  test ("abc" == 'a' : "bc") >>=
  test ("abc" == 'a' : 'b' : "c") >>=
  test ("abc" == 'a' : 'b' : 'c' : "") >>=
  test ("abc" == (foldr (:) [] ['a','b','c'])) >>=

  test ("abc" == ['a','b','c']) >>=

  checkComplainAndAdjustExpected 10 >>=

  test ([2, 3, 4] == [2, 3, 4]) >>=
  test ([2, 3, 4] == [2, 3] ++ [4]) >>=
  test ([2, 3, 4] == [2] ++ [3] ++ [4]) >>=
  test ([2, 3, 4] == (foldr (++) [] [[2],[3],[4]])) >>=
  test ([2, 3, 4] == (foldl (++) [] [[2],[3],[4]])) >>=
  test ([2, 3, 4] == 2 : [3, 4]) >>=
  test ([2, 3, 4] == 2 : [3, 4]) >>=
  test ([2, 3, 4] == 2 : 3 : [4]) >>=
  test ([2, 3, 4] == 2 : 3 : 4 : []) >>=
  test ([2, 3, 4] == (foldr (:) [] [2,3,4])) >>=

  checkComplainAndAdjustExpected 10 >>=

  test ( 0.5 == 1 / 2 ) >>=
  test ( 1 == 1.0 ) >>=
  test ( (1::Float) == 1.0 ) >>=

  test ( "a 1 1.5" == "a " ++ (show 1) ++ " " ++ (show 1.5)) >>=

  test ( 5 == ($ 2) (+ 3)) >>=
  test ( 5 == ($ 2) (3 +)) >>=

  checkComplainAndAdjustExpected 6 >>=

  return


