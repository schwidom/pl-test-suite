
public class Main
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  te.test( true);

  te.checkComplainAndAdjustExpected( 1);

  System.out.println( ""+ te.result());
 }
}

