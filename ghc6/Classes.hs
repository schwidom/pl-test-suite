module Classes where

 import TestEnv

 class Eq2 a where -- comparable with abstract class / interface in other programming languages
 
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
 
  (/=) x y = not (x Classes.== y)
  (==) x y = not (x Classes./= y)
 
 
 data D = X Int

 instance Eq2 D where
  (/=) (X i1) (X i2) = i1 Prelude.== i2 -- opposite Definition

 instance Eq D where
  (==) (X i1) (X i2) = i1 Prelude.== i2 -- usual Definition

 tests te = 
  
  return te >>=
  checkComplainAndAdjustExpected 0 >>=

  test ( (X 1) Prelude.== (X 1)) >>=
  test ( (X 1) Classes./= (X 1)) >>=

  test ( (X 1) Prelude./= (X 2)) >>=
  test ( (X 1) Classes.== (X 2)) >>=

  checkComplainAndAdjustExpected 4 >>=
  return
  


