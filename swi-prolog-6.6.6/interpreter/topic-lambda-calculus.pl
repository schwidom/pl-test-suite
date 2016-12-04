
lambda( PARAMS, CODE, PARAMS2) :- copy_term( (CODE, PARAMS), (CODEC, PARAMS2)), call(CODEC).

y(CODE) :- CODE= lambda( [F, RETF], ( % Y-Combinator

  RETF= lambda( [P, RETP], ( true

   , y(Y)
   , call( Y, [F, YF])
   , call( F, [YF, FYF])
   , call( FYF, [P, RETP])
  ))

 ))
 .

fak( CODE) :- CODE= lambda( [F, RETF], (  % factorial
  
  RETF= lambda( [N, RETN], ( 

   ( N=0 -> RETN= 1 ; true

   , NINC is N - 1
   , call(F, [NINC, RET_F_NINC])
   , RETN is N * RET_F_NINC
   )
  
  ))

 ))
 .

% fak(FAK), call(FAK, [fun,TMP1]), call( TMP1, [0, RES]). 
% fak(FAK), call(FAK, [fun,TMP2]), call(FAK,[TMP2,TMP1]), call( TMP1, [1, RES]). 
% fak(FAK), call(FAK, [fun,TMP3]), call(FAK, [TMP3,TMP2]), call(FAK,[TMP2,TMP1]), call( TMP1, [2, RES]). 

% y(Y), fak(FAK), call( Y, [FAK,TMP1]), call( TMP1, [0,RES]). % 1
% y(Y), fak(FAK), call( Y, [FAK,TMP1]), call( TMP1, [1,RES]). % 1
% y(Y), fak(FAK), call( Y, [FAK,TMP1]), call( TMP1, [2,RES]). % 2
% y(Y), fak(FAK), call( Y, [FAK,TMP1]), call( TMP1, [3,RES]). % 6
% y(Y), fak(FAK), call( Y, [FAK,TMP1]), call( TMP1, [4,RES]). % 24


main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 y(Y), fak(FAK), call( Y, [FAK,Y_FAK]),

 test( call( Y_FAK, [ 0, 1])),
 test( call( Y_FAK, [ 1, 1])),
 test( call( Y_FAK, [ 2, 2])),
 test( call( Y_FAK, [ 3, 6])),
 test( call( Y_FAK, [ 4, 24])),

 checkComplainAndAdjustExpected( 5),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

