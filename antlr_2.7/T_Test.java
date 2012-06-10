
// import antlr.runtime.*;

public class T_Test
{
 
 public static void main( String[] args) throws Exception
 {
  
  TestEnv te= new TestEnv();

  T_Lexer tl= new T_Lexer( System.in);
  tl.setTestEnv( te);

  T_Parser tp= new T_Parser( tl);
  tp.setTestEnv( te);

  te.checkComplainAndAdjustExpected( 0);
  tp.r();
  te.checkComplainAndAdjustExpected( 2);

  System.out.println( te.result());

 }
}
