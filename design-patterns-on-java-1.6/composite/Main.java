
public class Main
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);


  AbstractComposite l1= new Leaf( "l1");

  te.test( "(leaf l1)".equals( l1.operate()));

  AbstractComposite l2= new Leaf( "l2");

  te.test( "(leaf l2)".equals( l2.operate()));

  AbstractComposite cOf= new Composite();

  te.test( "(composite [])".equals( cOf.operate()));

  Composite cOfl1l2 = new Composite();
  cOfl1l2.aggregationOfAbstractComposites.add( l1);
  cOfl1l2.aggregationOfAbstractComposites.add( l2);

  te.test( "(composite [ (leaf l1) (leaf l2)])".equals( cOfl1l2.operate()));

  AbstractComposite l3= new Leaf( "l3");

  Composite cOfl3cOfl1l2= new Composite();
  cOfl3cOfl1l2.aggregationOfAbstractComposites.add( l3);
  cOfl3cOfl1l2.aggregationOfAbstractComposites.add( cOfl1l2);

  te.test( "(composite [ (leaf l3) (composite [ (leaf l1) (leaf l2)])])".equals( cOfl3cOfl1l2.operate()));

  te.checkComplainAndAdjustExpected( 5);

  System.out.println( ""+ te.result());
 }
}

// derived from Strategy Pattern ../strategy/

// see also Proxy-Pattern ../proxy/

