
public class Method_String_indexOf
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  te.test( 0== "ab".indexOf( ""));
  te.test( 0== "ab".indexOf( "", 0));
  te.test( 1== "ab".indexOf( "", 1));

  te.test( 0== "ab".indexOf( "a"));
  te.test( -1== "ab".indexOf( "a", 1));

  te.test( 0== "ab".indexOf( "ab"));

  te.test( 1== "ab".indexOf( "b"));
  te.test( 1== "ab".indexOf( "b", 1));

  te.test( -1== "ab".indexOf( "abc"));

  try
  {
   "".indexOf( null);
   te.test( false);
  }
  catch( NullPointerException npex)
  {
   te.test( true);
  }

  te.checkComplainAndAdjustExpected( 10);

  System.out.println( ""+ te.result());
 }
}

