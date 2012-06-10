
public class TopicClasses
{

 public static void main( String[] args)
 {

  class Base
  {
  
   public String f(){ return "Base";}
  }
  
  class Sub extends Base
  {
   
   public String f(){ return super.f()+ ":"+ "Sub";}
  }

  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  te.test( "Base".equals( new Base().f()));

  te.test( "Base:Sub".equals( new Sub().f()));

  te.checkComplainAndAdjustExpected( 2);

  System.out.println( ""+ te.result());
 }
}

