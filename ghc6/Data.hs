module Data where

 import TestEnv

 data X = A String Int | B Int String


 instance Show X where
  show (A s i) = "a: s: " ++ s ++ " i: " ++ (show i)
  show (B i s) = "b: i: " ++ (show i) ++ " s: " ++ s

 instance Eq X where
  (==) (A s1 i1) (A s2 i2) = s1==s2 && i1 == i2

 data Y = Y { a :: Int, b :: Int }

 instance Show Y where
  show (Y a b)= "y: a: " ++ (show a) ++ " b: " ++ (show b)

 instance Eq Y where
  (==) (Y a1 b1) (Y a2 b2) = a1 == a2 && b1 == b2

 tests te =
  return te >>=
  checkComplainAndAdjustExpected 0 >>=

-- instance Show X

  test ( "a: s: x i: 2" == (show (A "x" 2))) >>=
  test ( "b: i: 3 s: y" == (show (B 3 "y"))) >>=

-- instance Show Y

  test ( "y: a: 2 b: 3" == (show (Y 2 3))) >>=
  test ( "y: a: 2 b: 3" == (show (Y { a=2, b=3}))) >>=

-- accessors a, b of Y

  test ( 2 == (a (Y 2 3))) >>=
  test ( 3 == (b (Y 2 3))) >>=

  checkComplainAndAdjustExpected 6 >>=

-- instance EQ X

  test ((A "x" 2) == (A "x" 2)) >>=
  test ((A "x" 2) /= (A "y" 2)) >>=
  test ((A "x" 2) /= (A "x" 3)) >>=

  -- test ((B 1 "a") /= (B 1 "a")) >>= -- not defined "Main: Data.hs:13:2-46: Non-exhaustive patterns in function =="

-- instance EQ Y

  test ((Y 2 3) == (Y 2 3)) >>=
  test ((Y 2 3) /= (Y 2 4)) >>=
  test ((Y 2 3) /= (Y 1 3)) >>=

  checkComplainAndAdjustExpected 6 >>=

  return


