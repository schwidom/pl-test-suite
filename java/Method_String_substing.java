
public class Method_String_substing
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  te.test( "cd".equals( "abcd".substring( 2, 4)));
  te.test( "cd".equals( "abcd".substring( 2)));
  te.test( "abcd".equals( "abcd".substring( 0)));
  te.test( "abcd".equals( "abcd".substring( 0, 4)));
  te.test( "ab".equals( "abcd".substring( 0, 2)));
  te.test( "".equals( "abcd".substring( 2, 2)));

  try
  { 
   "abcd".substring( 0, 5);
   te.test( false);
  }
  catch( StringIndexOutOfBoundsException siofbex)
  {
   te.test( true);
   te.test( "String index out of range: 5".equals( siofbex.getMessage()));
  }
  
  try
  { 
   "abcd".substring( -1, 4);
   te.test( false);
  }
  catch( StringIndexOutOfBoundsException siofbex)
  {
   te.test( true);
   te.test( "String index out of range: -1".equals( siofbex.getMessage()));
  }
  
  try
  { 
   "abcd".substring( 2, 1);
   te.test( false);
  }
  catch( StringIndexOutOfBoundsException siofbex)
  {
   te.test( true);
   te.test( "String index out of range: -1".equals( siofbex.getMessage()));
  }
  

  te.checkComplainAndAdjustExpected( 12);

  System.out.println( ""+ te.result());
 }
}

