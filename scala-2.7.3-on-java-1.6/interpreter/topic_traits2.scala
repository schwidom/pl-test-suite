
val te= new TestEnv()

te.checkComplainAndAdjustExpected( 0)

abstract class C { def f() : Int; }

trait t { def f : Int = { 1 }}

case object o_of_C_and_t extends C with t;
case class C_of_C_and_t() extends C with t;

te.test( 1==o_of_C_and_t.f)
te.test( 1==C_of_C_and_t().f)

te.checkComplainAndAdjustExpected( 2)

println( ""+ te.result())


