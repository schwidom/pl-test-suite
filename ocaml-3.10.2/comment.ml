
let 
 checkComplainAndAdjustExpected= Testenv.TestEnv.checkComplainAndAdjustExpected and
 test= Testenv.TestEnv.test and
 result= Testenv.TestEnv.result;;


checkComplainAndAdjustExpected 0;;

(*
#! line comment (from vim syntax file) but leads to error
*)

(* this is a comment *)

(** this is a documentation comment *)

(* (* this is a nested comment *) *)

(**/**) (* <- special comment *)

checkComplainAndAdjustExpected 0;;

Printf.printf "%s\n" (result ());;


