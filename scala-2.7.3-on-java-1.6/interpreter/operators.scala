
val te= new TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( List(1, 2) == List(1) ::: List(2))
te.test( List( 1, 2, 3) == ( for( a <- List( 1, 2, 3)) yield a))


te.checkComplainAndAdjustExpected( 2)

te.test( 3 == 1 + 2)
te.test( 3 == (1).+(2))
te.test( (3).==((1).+(2)))

te.checkComplainAndAdjustExpected( 3)

te.test( (1, 2, 3) == ( 1, 2, 3))
te.test( (1, 2, 3) != ( 2, 1, 3))
te.test( java.lang.Class.forName( "scala.Tuple3").equals( (1, 2, 3).getClass()))

te.checkComplainAndAdjustExpected( 3)

println( ""+ te.result())


