
val te= new TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( true)

te.checkComplainAndAdjustExpected( 1)

println( ""+ te.result())


