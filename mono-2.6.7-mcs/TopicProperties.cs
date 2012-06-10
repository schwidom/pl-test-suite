namespace TopicProperties
{
 class TopicProperties
 {

  static int prop1Value= 0;

  static int prop1Set
  {
   set{ prop1Value= value;}
  }

  static int prop1Get
  {
   get{ return prop1Value;}
  }

  static int prop2Value= 0;

  static int prop2
  {
   set{ prop2Value= value;}
   get{ return prop2Value;}
  }

  static int propDirtyValue= 0;

  static int propDirty
  {
   get{ return propDirtyValue;}
   set{}
  }

  public static void Main()
  {
   TestEnv.TestEnv te= new TestEnv.TestEnv();

   te.CheckComplainAndAdjustExpected( 0);

   
   te.Test( 0==prop1Get);
   prop1Set= 1;
   te.Test( 1==prop1Get);
   prop1Value= 2;
   te.Test( 2==prop1Get);

   te.Test( 0==prop2);
   prop2= 1;
   te.Test( 1==prop2);

   te.CheckComplainAndAdjustExpected( 5);

   prop2=0;
   te.Test( 0 == prop2++);
   te.Test( 1 == prop2);
   te.Test( 2 == ++prop2);
   te.Test( 2 == prop2);

   te.CheckComplainAndAdjustExpected( 4);

   te.Test( 0 == propDirty);
   te.Test( 1 == ++propDirty);
   te.Test( 0 == propDirty);
   te.Test( 0 == propDirty++);

   te.CheckComplainAndAdjustExpected( 4);

   System.Console.WriteLine( te.Result());

  }
 }
}
