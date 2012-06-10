
val te= new TestEnv()

te.checkComplainAndAdjustExpected( 0)

def i () : Int = { 1}

te.test( 1==i)

te.checkComplainAndAdjustExpected( 1)

val g1 = { i : (Any) => i : Any }
val g2 : (Any) => Any = { i => i }

te.test( 4==g1( 4))
te.test( 4==g2( 4))

def f( f: (Any) => Any) { te.test( true)}

f( g1)
f( g2)
f{ i => i }

te.checkComplainAndAdjustExpected( 5)

val h1 = { a : (int) => b : (int) =>  a * b }
val h2 = { ab : (int, int) => val (a, b)= ab; a*b } // baustelle : kuerzer?

te.test( 6 == h1(2)(3))
te.test( 6 == h2(2, 3))

te.checkComplainAndAdjustExpected( 2)

println( ""+ te.result())


