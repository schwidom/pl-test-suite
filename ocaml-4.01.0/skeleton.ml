
open Testenv.TestEnv;;

checkComplainAndAdjustExpected 0;;
test true;;
checkComplainAndAdjustExpected 1;;

Printf.printf "%s\n" (result ());;


