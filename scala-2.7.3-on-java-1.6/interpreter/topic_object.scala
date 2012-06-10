
val te= new TestEnv()

te.checkComplainAndAdjustExpected( 0)

object o1
{
 te.test( true) 
}

object o2
{
 te.test( true) 

 def apply()
 {
  te.test( true);
 }
}

object o3
{
 te.test( true) 

 def apply()
 {
  te.test( true);
 }
}

te.checkComplainAndAdjustExpected( 0)

o1

te.checkComplainAndAdjustExpected( 1)

o1

te.checkComplainAndAdjustExpected( 0)

o2

te.checkComplainAndAdjustExpected( 1)


o2()

te.checkComplainAndAdjustExpected( 1)

o2.apply()

te.checkComplainAndAdjustExpected( 1)

o3()

te.checkComplainAndAdjustExpected( 2)

o3()

te.checkComplainAndAdjustExpected( 1)

println( ""+ te.result())


