
let 
 checkComplainAndAdjustExpected= Testenv.TestEnv.checkComplainAndAdjustExpected and
 test= Testenv.TestEnv.test and
 result= Testenv.TestEnv.result;;

checkComplainAndAdjustExpected 0;;

let lt= function a -> function b -> if a = b then 0 else if a < b then -1 else 1;;
let gt a b = if a = b then 0 else if a < b then 1 else -1;;

test ([1;2;3] = List.sort lt [2;1;3]);;
test ([3;2;1] = List.sort gt [2;1;3]);;
test ([1;2;3] = List.sort Pervasives.compare [2;1;3]);;
test ([1;2;3] = List.sort compare [2;1;3]);;

checkComplainAndAdjustExpected 4;;

let a= [|2;1;3|];;
test (not ([|1;2;3|] = a));;
Array.sort lt a;;
test ([|1;2;3|] = a);;

checkComplainAndAdjustExpected 2;;

Printf.printf "%s\n" (result ());;


