
// import antlr.runtime.*;

import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

public class GeneralTest
{
 
 public static void main( String[] args) throws Exception
 {
  
  TestEnv teLexer= new TestEnv();
  TestEnv teParser= new TestEnv();

  Class cLexer= Class.forName( args[0 ]);
  Constructor conLexer= cLexer.getConstructor( InputStream.class);
  Object oLexer= conLexer.newInstance( System.in);
  Method mLexer_setTestEnv= cLexer.getMethod( "setTestEnv", TestEnv.class);
  mLexer_setTestEnv.invoke( oLexer, teLexer);
  
  Class cParser= Class.forName( args[1 ]);
  Constructor conParser= cParser.getConstructor( antlr.TokenStream.class);
  Object oParser= conParser.newInstance( oLexer);
  Method mParser_setTestEnv= cParser.getMethod( "setTestEnv", TestEnv.class);
  mParser_setTestEnv.invoke( oParser, teParser);

  teLexer.checkComplainAndAdjustExpected( 0);
  teParser.checkComplainAndAdjustExpected( 0);

  Method mParser_r= cParser.getMethod( "r");
  mParser_r.invoke( oParser);

  teLexer.checkComplainAndAdjustExpected( Integer.parseInt( args[2 ]));
  teParser.checkComplainAndAdjustExpected( Integer.parseInt( args[3 ]));

  System.out.println( "Lexer: "+ teLexer.result());
  System.out.println( "Parser: "+ teParser.result());

 }
}
