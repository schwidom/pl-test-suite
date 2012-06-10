public class Main
{

 public static void main( String[] args)
 {

  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  UseTheStrategyPattern utsp= new UseTheStrategyPattern();

  AbstractStrategy cs1= new ConcreteStrategy( "ConcreteStrategy1");
  ConcreteStrategy cs2= new ConcreteStrategy( "ConcreteStrategy2");

  utsp.setAbstractStrategy( cs1);
  te.test( "ConcreteStrategy1 operates".equals( utsp.operate()));
  utsp.setAbstractStrategy( cs2);
  te.test( "ConcreteStrategy2 operates".equals( utsp.operate()));

  te.checkComplainAndAdjustExpected( 2);

  System.out.println( ""+ te.result());
 }
}
