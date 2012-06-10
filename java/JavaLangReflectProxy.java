import java.lang.reflect.Proxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class JavaLangReflectProxy
{

 interface I
 {
  public String f();
 }

 public static void main( String[] args)
 {

  final TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  Class c= I.class;

  try
  {
   final Method m= c.getMethod( "f", new Class[]{});

   I i= (I) Proxy.newProxyInstance ( c.getClassLoader(), new Class[]{ c},
    new InvocationHandler()
    {
    
     public Object invoke( Object proxy, Method method, Object[] args)
     {
      //System.out.println( "Proxy "+ proxy); // Stack Overflow
      te.test( m.equals( method));
      te.test( proxy instanceof I);
      return "RETURN VALUE";
     }
   
    }
   );
 
   te.test( "RETURN VALUE".equals( i.f()));
   te.test( Proxy.isProxyClass( i.getClass()));

  }
  catch( NoSuchMethodException nsmex)
  {
   te.test( false);
  }
 
  te.checkComplainAndAdjustExpected( 4);

  System.out.println( ""+ te.result());
 }
}

