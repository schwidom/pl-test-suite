
let 
 checkComplainAndAdjustExpected= Testenv.TestEnv.checkComplainAndAdjustExpected and
 test= Testenv.TestEnv.test and
 result= Testenv.TestEnv.result;;

checkComplainAndAdjustExpected 0;;

type ab= A | B;;
let x= B;;

match x with 
| unbound -> test true
;;

match x with 
| unbound -> test (unbound == x)
;;

match x with 
| unbound -> test (unbound == B)
;;

match x with 
| (_ : ab) -> test true
;;

match x with 
| (B : ab) -> test true
| _ -> test false
;;

checkComplainAndAdjustExpected 5;;

type bc= B | C;;
let y= B;;

(* test (x=y);; *) (* leads to error *)
(* no construction of B from type ab possible *)

match x with 
| _ -> test true
;;

match x with 
| _ -> test true
;;

match x with 
| (_) -> test true
;;

match x with 
| ab -> test true
;;

match y with 
| bc -> test true
;;

checkComplainAndAdjustExpected 5;;

type i= { i : int };;

let f ({i=x}:i)= x;;
test (1==f {i=1});;

let i= {i= 1};;

match i with
| unbound -> test (unbound = {i= 1})
;;

match i with
| {i=unbound} -> test (unbound == 1)
;;

match i with
| {i= 2} -> test false
| {i= 1} -> test true
| _ -> test false
;;

checkComplainAndAdjustExpected 4;;

type k= I of int;;

let f (I(x):k) = x;;
test (1==f (I(1)));;

let i= I( 1);;

match i with
| unbound -> test (unbound = I( 1))
;;

match i with
| I(unbound) -> test (unbound == 1)
;;

match i with
| I(_) -> test true
;;

match i with
| I( 2) -> test false
| I( 1) -> test true
| _ -> test false
;;

checkComplainAndAdjustExpected 5;;


type is= { i : int; s : string};;
type l= I of int * is | K of int*int*string;;

let f (I(x,{i=y; s=z})|K (x, y, z) :l)= (x, y, z);;
test ((1, 2, "3")=f (I(1,{i=2;s="3"})));;
test ((1, 2, "3")=f (K(1,2,"3")));;

let f = function
| I(x,{i=y; s=z}) -> (x, y, z)
| K (x, y, z) -> (x, y, z)
;;

test ((1, 2, "3")=f (I(1,{i=2;s="3"})));;
test ((1, 2, "3")=f (K(1,2,"3")));;

(*type l= I of int * is | K;;*)

let l= I(2,{i=3; s="4"});;

match l with
| unbound -> test (unbound = I(2,{i=3; s="4"}))
;;


match l with
| I(u1,u2) -> test ( u1 == 2 && u2 = {i=3; s="4"})
| K(_) -> test false
;;

match l with
| I(u1,{i=u2; s=u3}) -> test (u1 == 2 && u2 == 3 && u3 = "4")
| K(_) -> test false
;;

checkComplainAndAdjustExpected 7;;

Printf.printf "%s\n" (result ());;



