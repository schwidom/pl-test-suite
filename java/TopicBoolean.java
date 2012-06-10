
public class TopicBoolean
{
 public static void main( String[] args)
 {

  TestEnv te= new TestEnv();
  te.checkComplainAndAdjustExpected( 0);

  te.test( ( true ^ false));
  te.test( ( false ^ true));
  te.test( ( false ^ true ^ false));
  te.test( ( true ^ true ^ true));
  te.test( ( true & true));
  te.test( ( true | false));
  te.test( !( true & false));
  te.test( !( false | false));

  te.checkComplainAndAdjustExpected( 8);
  System.out.println( te.result());
 }
}

