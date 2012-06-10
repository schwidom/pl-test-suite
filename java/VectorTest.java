
import java.util.Vector;

public class VectorTest
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  Vector v1= new Vector();
  Vector v2= new Vector(){{ add( "1"); add( "2");}};

  te.test( 0==v1.size());
  te.test( 2==v2.size());

  te.test( "1"==v2.elementAt( 0)); // suspicious

  te.test( new String("1")!=v2.elementAt( 0));

  te.test( "1".equals( v2.elementAt( 0)));

  te.test( ! v1.equals( v2));

  v1.add( "1");
  v1.add( "2");

  te.test( v1.equals( v2));
  
  te.checkComplainAndAdjustExpected( 7);

  System.out.println( ""+ te.result());
 }
}

