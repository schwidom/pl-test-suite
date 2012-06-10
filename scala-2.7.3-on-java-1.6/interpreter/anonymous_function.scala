
val te= new TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( 9 == ((x : Int) => x*x)( 3))

te.checkComplainAndAdjustExpected( 1)

println( ""+ te.result())


