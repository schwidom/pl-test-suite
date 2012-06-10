
public class TopicOperators
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  te.test( "a"=="a");

  te.test( "a"!=new String( "a"));

  te.checkComplainAndAdjustExpected( 2);

  System.out.println( ""+ te.result());
 }
}

