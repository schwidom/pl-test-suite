
public class TopicHashCode
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  StringBuffer sb1= new StringBuffer();
  StringBuffer sb2= new StringBuffer( "a");

  int i= 0;
  for( ; i< 500; i++)
  {
   if( sb1.toString().hashCode()==sb2.toString().hashCode()) break;
   sb1.append( "a");
   sb2.append( "a");
  }
 
  te.test( 500==i); 

  te.checkComplainAndAdjustExpected( 1);

  System.out.println( ""+ te.result());
 }
}

