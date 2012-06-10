
val te= new TestEnv()

te.checkComplainAndAdjustExpected( 0)

case class C( i : Int)

var c= C( 4)

te.test( 4==c.i)

te.test( "C(4)" equals ""+ c)
te.test( "C(4)" equals c.toString )
te.test( "C(4)" equals (c toString))

var c1= C( 5)
var c2= C( 5)

te.test( c1.hashCode == c2.hashCode)

te.test( c1 equals c2)
te.test( ! c1.equals( c))

te.checkComplainAndAdjustExpected( 7)

// see topic_pattern_matching.scala :

val maybe = 'maybe

val f : (Any) => Any = { case C( 4) => true ; case C(_) => maybe; case _ => false}

te.test( true == f( c))
te.test( maybe == f( c1))
te.test( false == f( "X"))

te.checkComplainAndAdjustExpected( 3)

println( ""+ te.result())


