
let 
 checkComplainAndAdjustExpected= Testenv.TestEnv.checkComplainAndAdjustExpected and
 test= Testenv.TestEnv.test and
 result= Testenv.TestEnv.result;;


checkComplainAndAdjustExpected 0;;
test true;;
test true;;
checkComplainAndAdjustExpected 2;;
test true;;
test true;;
test true;;
checkComplainAndAdjustExpected 3;;

Printf.printf "%s\n" (result ());;


