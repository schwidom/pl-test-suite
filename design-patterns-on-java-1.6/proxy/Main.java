public class Main
{

 public static void main( String[] args)
 {

  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  UseTheProxyPattern utpp= new UseTheProxyPattern();

  Real r= new Real();
  Abstract por= new ProxyOfReal( r);

  utpp.setAbstract( r);
  te.test( "Real operates".equals( utpp.operate()));
  utpp.setAbstract( por);
  te.test( "ProxyOfReal determines that (Real operates) and how (Real operates)".equals( utpp.operate()));

  te.checkComplainAndAdjustExpected( 2);

  System.out.println( ""+ te.result());
 }
}

// derived from Strategy Pattern ../strategy/
