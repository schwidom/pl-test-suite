
// import antlr.runtime.*;

public class Minimal_Test
{
 
 public static void main( String[] args) throws Exception
 {
  
  TestEnv te= new TestEnv();

  Minimal_Lexer tl= new Minimal_Lexer( System.in);
  tl.setTestEnv( te);

  Minimal_Parser tp= new Minimal_Parser( tl);
  tp.setTestEnv( te);

  te.checkComplainAndAdjustExpected( 0);
  tp.r();
  te.checkComplainAndAdjustExpected( 2);

  System.out.println( te.result());

 }
}
