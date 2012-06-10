
let 
 checkComplainAndAdjustExpected= Testenv.TestEnv.checkComplainAndAdjustExpected and
 test= Testenv.TestEnv.test and
 result= Testenv.TestEnv.result;;

checkComplainAndAdjustExpected 0;;
test true;;
checkComplainAndAdjustExpected 1;;

Printf.printf "%s\n" (result ());;


