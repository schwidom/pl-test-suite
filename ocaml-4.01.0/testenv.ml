module TestEnv=
 struct

  let countOk= ref 0 and countFail= ref 0 and countLatest= ref 0

  let test b= 
   if b 
   then
    (
     countOk:= !countOk+ 1;
     true
    )
   else 
    (
     Printf.printf "test failed\n";
     countFail:= !countFail+ 1; 
     false
    )

  let checkComplainAndAdjustExpected count=
   let countTests= !countOk + !countFail in
    let countTestsLocal= countTests - !countLatest in
     (
      countLatest:= countTests;
      if count == countTestsLocal
      then true
      else 
       (
        Printf.printf "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal: %d count: %d\n" countTestsLocal count;
        false 
       )
     )

  let result ()=
   Printf.sprintf "tests: ok: %d fail: %d countLatest: %d" !countOk !countFail !countLatest

end;;
