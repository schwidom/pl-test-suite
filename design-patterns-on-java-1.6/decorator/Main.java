
public class Main
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  AbstractComponent pizza= new ConcreteComponent( "Pizza");

  AbstractComponent pizzaWithBacon
   = new ConcreteDecorator( "Bacon", pizza);
  AbstractComponent pizzaWithBaconAndTomatoes
   = new ConcreteDecorator( "Tomatoes", pizzaWithBacon);
  AbstractComponent pizzaWithBaconTomatoesAndPineapple
   = new ConcreteDecorator( "Pineapple", pizzaWithBaconAndTomatoes);

  te.test( "component Pizza".
   equals( pizza.operate()));

  te.test( "(Bacon decorates component Pizza)".
   equals( pizzaWithBacon.operate()));

  te.test( "(Tomatoes decorates (Bacon decorates component Pizza))".
   equals( pizzaWithBaconAndTomatoes.operate()));

  te.test( "(Pineapple decorates (Tomatoes decorates (Bacon decorates component Pizza)))".
   equals( pizzaWithBaconTomatoesAndPineapple.operate()));

  te.checkComplainAndAdjustExpected( 4);

  System.out.println( ""+ te.result());
 }
}

// see also: Strategy Pattern ../strategy/


