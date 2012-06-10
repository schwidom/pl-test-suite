
public class TopicReflection
{

 interface I{};

 public static void main( String[] args)
 {

  final TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  new I(){{

   class C {};
   C c= new C();

   te.test( c.getClass().getName().endsWith( "C"));
   te.test( c.getClass().getName().startsWith( "TopicReflection"));

   te.test( 0==c.getClass().getFields().length);
   te.test( 1==c.getClass().getDeclaredFields().length);

   te.test( c.getClass().getDeclaredFields()[0 ].getName().startsWith( "this"));

   try
   {
    te.test( c.getClass().getDeclaredFields()[0 ].get( c) instanceof I);
   } catch ( IllegalAccessException iae) 
   {
    te.test( false);
   }

   te.test( 0==c.getClass().getDeclaredMethods().length);

   te.test( Object.class.getMethods().length==c.getClass().getMethods().length);

  }};

  te.checkComplainAndAdjustExpected( 8);

  System.out.println( ""+ te.result());
 }
}

