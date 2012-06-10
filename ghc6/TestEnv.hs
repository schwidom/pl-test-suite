module TestEnv where

 data TE = TE { countOk :: Int, countFail :: Int, countLatest :: Int}

-- test b = print b
 
 startTests :: (Monad m) => () -> m TE
 startTests () =
  do
   return (TE { countOk= 0, countFail= 0, countLatest= 0}) -- (TE 0 0 0)
 
 -- test :: Bool -> TE -> IO ()
 -- test b te = print b

 -- test :: Bool -> TE -> (IO (), (Maybe TE))
 -- test b te = (print "", Just te)

 -- test :: Bool -> TE -> (Maybe (IO (), TE))
 -- test b te = Just (print "", te)

 test :: Bool -> TE -> IO TE
 test b te =
  if b
   then
    return (TE (1 + (countOk te)) (countFail te) (countLatest te))
   else
    print "test failed" >>
    return (TE (countOk te) (1 + (countFail te)) (countLatest te))


 checkComplainAndAdjustExpected :: Int -> TE -> IO TE
 checkComplainAndAdjustExpected count te=
  let 
   countTests= (countOk te) + (countFail te)
   countTestsLocal= countTests - (countLatest te)
   ret= (TE (countOk te) (countFail te) countTests)
   in
   if ( count == countTestsLocal)
    then
     return ret
    else
     (print ("Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal:" ++ (show countTestsLocal) ++ " count: " ++ (show count))) >>
     return ret

  


 result :: TE -> IO ()
 -- result :: TE -> String 
 result te =
  do
   print ( "tests: ok: " ++ (show (countOk te)) ++ " fail: " ++ (show (countFail te)) ++ " countLatest: " ++ (show (countLatest te)))
   
