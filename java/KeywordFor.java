
import java.util.Arrays;

public class KeywordFor
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  for( int i= 0; i< 5; i++)
   te.test( true);

  te.checkComplainAndAdjustExpected( 5);

  for( int i : Arrays.asList( 0, 1, 2, 3, 4))
   te.test( true);

  te.checkComplainAndAdjustExpected( 5);

  System.out.println( ""+ te.result());
 }
}

