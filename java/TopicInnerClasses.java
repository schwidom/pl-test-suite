
public class TopicInnerClasses
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  class Outer
  {
   int i;
   public Outer( int i){ this.i= i;}

   class Inner
   {
    int i;
    public Inner() { this.i= Outer.this.i;}
   }
  }

  Outer o= new Outer( 456);
  Outer.Inner i= o. new Inner(); 

  te.test( 456 == i.i);

  te.checkComplainAndAdjustExpected( 1);

  System.out.println( ""+ te.result());
 }
}

