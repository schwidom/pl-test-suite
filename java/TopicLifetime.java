

public class TopicLifetime
{

 interface I{};

 public static void main( String[] args)
 {
  final TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  int i= 0;

  new I(){{

   int i= 1;
   te.test( 1==i);
  }};

  te.test( 0==i);

  te.checkComplainAndAdjustExpected( 2);

  System.out.println( ""+ te.result());
 }
}

