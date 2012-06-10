
let 
 checkComplainAndAdjustExpected= Testenv.TestEnv.checkComplainAndAdjustExpected and
 test= Testenv.TestEnv.test and
 result= Testenv.TestEnv.result;;

checkComplainAndAdjustExpected 0;;

test (3. = float 3);;
test (3. = float_of_int 3);;

test (3 = int_of_float 3.9);;

test (3. = floor 3.5);; 
test (3. = ceil 2.5);;

test ("3" = Printf.sprintf "%d" 3);;

test (49 = int_of_char '1');;
test (65 = int_of_char 'A');;
test (97 = int_of_char 'a');;

test ('1' = char_of_int 49);;

checkComplainAndAdjustExpected 10;;

Printf.printf "%s\n" (result ());;


