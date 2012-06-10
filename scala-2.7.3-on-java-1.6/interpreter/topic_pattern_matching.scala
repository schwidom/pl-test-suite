
val te= new TestEnv()

te.checkComplainAndAdjustExpected( 0)

val f : (Boolean) => Int = 
{
 case true => 1
 case false => 2
}

te.test( 1==f( true))
te.test( 2==f( false))

te.checkComplainAndAdjustExpected( 2)

val g : (Boolean) => Boolean =
{
 case r @ true => r 
 case r @ false => r 
}

te.test( true == g( true))
te.test( false == g( false))

te.checkComplainAndAdjustExpected( 2)

val h : ( List[ Any]) => Any =
{
 case List( r @ _) => r
}

te.test( 1 == h( List( 1)))
te.test( "a" == h( List( "a")))

te.checkComplainAndAdjustExpected( 2)

val i : (Any) => Any =
{
 case true => false
 case false => true
 case r @ _ => r
}

te.test( false == i( true))
te.test( true == i( false))

te.test( 1 == i( 1))

te.checkComplainAndAdjustExpected( 3)

println( ""+ te.result())


