
public class HelloWorld
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  System.out.println( "Hello World");

  te.checkComplainAndAdjustExpected( 0);

  System.out.println( ""+ te.result());
 }
}

