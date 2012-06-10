m4_divert( m4_decr( m4_divnum))

m4_changequote( [,])

m4_define( [EOL], [
])

m4_define( [tst_countOk], 0)
m4_define( [tst_countFail], 0)
m4_define( [tst_countLatest], 0)

m4_define( [test], [m4_divert( m4_decr( m4_divnum))

 m4_ifelse( [$1], [], [m4_errprint( [error in ] m4___file__ m4___line__ [: no parameter given] EOL) m4_m4exit( 1)])

 m4_pushdef( [TESTCONDITION], [$1])
 m4_pushdef( [TMP], 0)

 m4_ifelse( m4_defn( [TESTCONDITION]), [true], [m4_define( [TMP], m4_incr( TMP))])
 m4_ifelse( m4_defn( [TESTCONDITION]), [false], [m4_define( [TMP], m4_incr( TMP))])

 m4_ifelse( 1, TMP, [], 
  [m4_errprint( [error in ] m4___file__ m4___line__ [: true or false expected, "]m4_defn( [TESTCONDITION])[" given]EOL)

  m4_m4exit( 1)
  ]
 ) 

 m4_popdef( [TMP])

 m4_ifelse( m4_defn( [TESTCONDITION]), [true], [
   m4_define( [tst_countOk], m4_incr( tst_countOk))
  ],
  m4_defn( [TESTCONDITION]), [false], [
   m4_define( [tst_countFail], m4_incr( tst_countFail))
   m4_errprint( [test failed in ] m4___file__ m4___line__ EOL)
  ]
 )


 m4_popdef( [TESTCONDITION])

 m4_divert( m4_incr( m4_divnum))m4_dnl
])

m4_define( [checkComplainAndAdjustExpected], [m4_divert( m4_decr( m4_divnum))

 m4_ifelse( [$1], [], [m4_errprint( [error in ] m4___file__ m4___line__ [: no parameter given] EOL) m4_m4exit( 1)])
 
 m4_pushdef( [count], [$1])
 m4_pushdef( [countTests], m4_eval( tst_countOk + tst_countFail))
 m4_pushdef( [countTestsLocal], m4_eval( countTests - tst_countLatest))

 m4_define( [tst_countLatest], countTests)

 m4_ifelse( count, countTestsLocal, [], [
   m4_errprint( [error in ] m4___file__ m4___line__ [: Expected Test Count (from last checkpoint to here) doesn't match:] [countTestsLocal:] countTestsLocal [count:] count EOL)
  ]
 )

 m4_popdef( [countTestsLocal])
 m4_popdef( [countTests])
 m4_popdef( [count])

 m4_divert( m4_incr( m4_divnum))m4_dnl
])

m4_define( [result], [[tests: ok: ] tst_countOk [fail:] tst_countFail [countLatest:] tst_countLatest]) 

m4_define( [equal], [m4_ifelse( [$1], [$2], [true], [false])])

m4_divert( m4_incr( m4_divnum))m4_dnl
