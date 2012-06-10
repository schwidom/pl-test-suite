
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import java.util.regex.MatchResult;

import java.util.regex.PatternSyntaxException;

import java.util.Arrays;

public class JavaUtilRegex
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  {
   try
   {
    Pattern p= Pattern.compile( "*");
    te.test( false);
   }
   catch( PatternSyntaxException psex)
   {
    te.test( true);
    te.test( "Dangling meta character '*' near index 0\n*\n^".equals( psex.getMessage())); // could fail in future Versions
   }
  }

  {
   Pattern p= Pattern.compile( "ab*c");

   Matcher m= p.matcher( "ac");
   te.test( m.matches());

   te.test( p.matcher( "abc").matches());

   te.test( ! p.matcher( "abcd").matches());

   te.test( Pattern.matches( "ab*c", "abbc"));
  }

  te.checkComplainAndAdjustExpected( 6);

  te.test( Arrays.asList( "a", "b", "c").equals( Arrays.asList( Pattern.compile( ",").split( "a,b,c"))));

  te.checkComplainAndAdjustExpected( 1);

  {
   Pattern p= Pattern.compile( "ab*c");

   StringBuffer sb= new StringBuffer();
   //StringBuilder sb= new StringBuilder();


   Matcher m= p.matcher( sb);

   te.test( ! m.matches());
   te.test( m.hitEnd());

   sb.append( "a");
   m.reset();

   te.test( ! m.matches());
   te.test( m.hitEnd());

   sb.append( "b");
   m.reset();

   te.test( ! m.matches());
   te.test( m.hitEnd());

   sb.append( "c");
   m.reset();

   te.test( m.matches());
   te.test( ! m.hitEnd());

   sb.append( "x");
   m.reset();

   te.test( ! m.matches());
   te.test( ! m.hitEnd());
  }

  te.checkComplainAndAdjustExpected( 10);

  {

   Pattern p= Pattern.compile( "a$");

   Matcher m= p.matcher( "a");

   te.test( m.matches());
   te.test( m.requireEnd());
  }

  {

   Pattern p= Pattern.compile( "a");

   Matcher m= p.matcher( "a");

   te.test( m.matches());
   te.test( ! m.requireEnd());
  }

  te.checkComplainAndAdjustExpected( 4);

  System.out.println( ""+ te.result());
 }
}

