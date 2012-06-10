
public class Main
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  Model m= new Model();

  m.setState( "initial state");

  Controller c= new Controller( m);
  View v= new View( m);

  c.setView( v);
  v.setController( c);

  te.test( "view display: initial state".equals( v.display()));

  te.test( "nothing to display".equals( v.display()));

  v.input( "1");

  te.test( "view display: changed state: 1".equals( v.display()));

  te.test( "nothing to display".equals( v.display()));

  te.checkComplainAndAdjustExpected( 4);

  System.out.println( ""+ te.result());
 }
}

