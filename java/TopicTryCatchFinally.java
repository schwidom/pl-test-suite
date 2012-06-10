
public class TopicTryCatchFinally
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  try
  {
   if( true) throw new RuntimeException();
   te.test( false);
  }
  catch( RuntimeException rex)
  {
   te.test( true);
  }
  finally
  {
   te.test( true);
  }

  te.checkComplainAndAdjustExpected( 2);

  System.out.println( ""+ te.result());
 }
}

