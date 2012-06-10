module Data_Typeable where

 import TestEnv

 import Data.Typeable

 tests te =

  return te >>=
  checkComplainAndAdjustExpected 0 >>=

  test ("a" == tyConString (typeRepTyCon (mkTyConApp (mkTyCon "a") []))) >>=

  test ("[Char]" == (show (typeOf ""))) >>=
  test ("[Char]" == (show (typeOf (""::String)))) >>=

  test ("TypeRep" == (show (typeOf (typeOf "")))) >>=
  test ("TyCon" == (show (typeOf (typeRepTyCon (typeOf ""))))) >>=

  -- test ("Integer" == (show (typeOf 1))) >>=
  test ("Int" == (show (typeOf (1::Int)))) >>=
  test ("Float" == (show (typeOf (1::Float)))) >>=

  -- test ("() -> IO ()" == (show (typeOf (print)))) >>=
  test ("() -> IO ()" == (show (typeOf (print::(() -> IO ()))))) >>=
  test ("[Char] -> IO ()" == (show (typeOf (print::(String -> IO ()))))) >>=


  checkComplainAndAdjustExpected 9 >>=
  return


