
val te= new TestEnv()

te.checkComplainAndAdjustExpected( 0)


trait ta { def fa : Int = { 1 }}

trait tb { def fb : Int = { 2 }}

te.test( 1 == new ta(){}.fa)
te.test( 2 == new tb(){}.fb)

trait tab extends ta with tb;

te.test( 1 == new tab(){}.fa)
te.test( 2 == new tab(){}.fb)

case object o_of_ta_tb extends ta with tb;
case object o_of_tab extends tab;

te.test( 1==o_of_ta_tb.fa)
te.test( 2==o_of_ta_tb.fb)

te.test( 1==o_of_tab.fa)
te.test( 2==o_of_tab.fb)

case class Cof_ta_tb() extends ta with tb;
case class Cof_tab() extends tab;

te.test( 1==Cof_ta_tb().fa)
te.test( 2==Cof_ta_tb().fb)

te.test( 1==Cof_tab().fa)
te.test( 2==Cof_tab().fb)

te.checkComplainAndAdjustExpected( 12)

println( ""+ te.result())


