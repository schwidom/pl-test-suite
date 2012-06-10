
module Main where

 import TestEnv
 import TestTest
 import Skeleton
 import Types
 import AddModuleTest
 import Operators
 import Data
 import Polymorphism
 import Data_Typeable
 import Classes
 import KeywordDeriving
 import TopicLists
 import OperatorDollar
 import OperatorDot

 main =
  
  startTests () >>=
  checkComplainAndAdjustExpected 0 >>=
  TestEnv.test True >>=
  test True >>= -- non ambiguous
  checkComplainAndAdjustExpected 2 >>=
  TestTest.tests >>=
  Skeleton.tests >>=
  Types.tests >>=
  AddModuleTest.tests >>=
  Operators.tests >>=
  Data.tests >>=
  Polymorphism.tests >>=
  Data_Typeable.tests >>=
  Classes.tests >>=
  KeywordDeriving.tests >>=
  TopicLists.tests >>=
  OperatorDollar.tests >>=
  OperatorDot.tests >>=
  -- tests -- ambiguous
  checkComplainAndAdjustExpected 0 >>=
  result
  
