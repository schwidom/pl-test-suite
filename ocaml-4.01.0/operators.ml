
let 
 checkComplainAndAdjustExpected= Testenv.TestEnv.checkComplainAndAdjustExpected and
 test= Testenv.TestEnv.test and
 result= Testenv.TestEnv.result;;

checkComplainAndAdjustExpected 0;; 

test true;;

test ("a" = "a");;
test (not ("a" == "a"));;
test ("a" != "a");;
test (not ("a" <> "a"));;

test (1. = 1.);;
test (not (1. == 1.));;
test (1. != 1.);;
test (not (1. <> 1.));;

test (1 = 1);;
test (1 == 1);;
test (not (1 != 1));;
test (not (1 <> 1));;

test (5 = 2 + 3);;
test (5 == 2 + 3);;

test (6 == 2 * 3);;

test (5. = 2. +. 3.);;
test (5. != 2. +. 3.);;

test (6. = 2. *. 3.);;

test ("ab" = "a" ^ "b");;

test (2 == 9 mod 7);;
test (2 == (9 - 7) mod 7);;
test (-5 == (9 - (2 * 7)) mod 7);;

checkComplainAndAdjustExpected 23;;

(* lists *)

test ([] = []);;
test ([] == []);;
test ([1] = [1]);;
test ([1] != [1]);;
test (["a"] = ["a"]);;
test ([1; 2] = [1] @ [2]);;
test (["a"; "b"] = ["a"] @ ["b"]);;

checkComplainAndAdjustExpected 7;;

(* vectors *)

test ([||] = [||]);;
test ([||] == [||]);;
test ([|1|] = [|1|]);;
test ([|1|] != [|1|]);;
test ([|"a"|] = [|"a"|]);;

checkComplainAndAdjustExpected 5;;



test (1 < 2);;
test (1. < 2.);;
test ("a" < "b");;
test ("a" < "aa");;

checkComplainAndAdjustExpected 4;;

Printf.printf "%s\n" (result ());;


