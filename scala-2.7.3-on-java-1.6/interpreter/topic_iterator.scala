
val te= new TestEnv()

te.checkComplainAndAdjustExpected( 0)

val i1= Iterator.from( 0)

val i2= i1.map { case x => 2*x} // baustelle : was bedeutet case?
val i3= i1.map { x => 2*x}

te.test( 0==i1.next)
te.test( 2==i2.next)
te.test( 4==i3.next())
te.test( 6==(i3 next))
te.test( 4==(i1 next()))

te.checkComplainAndAdjustExpected( 5)

te.test( 2+ 2* i1.next==i2.next)
te.test( 2+ 2* i1.next==i2.next)
te.test( 2+ 2* i1.next==i3.next)

te.checkComplainAndAdjustExpected( 3)

te.test( i2.next+ 2 == 2* i1.next)
te.test( i3.next+ 2 == 2* i1.next)
te.test( i3.next+ 2 == 2* i1.next)

te.checkComplainAndAdjustExpected( 3)

println( ""+ te.result())


