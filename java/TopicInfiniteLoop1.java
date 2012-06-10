
import java.util.Vector;

public class TopicInfiniteLoop1
{

 public static void main( String[] args)
 {

  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  Vector v= new Vector();
  v.add( v);
  
  try
  {
   v.hashCode();
   te.test( false);
  }
  catch( StackOverflowError soerr) // only for test poroposes: never catch Errors!
  {
   te.test( true);
  }

  te.checkComplainAndAdjustExpected( 1);

  System.out.println( ""+ te.result());
 }
}

