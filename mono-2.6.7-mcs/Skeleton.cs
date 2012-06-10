namespace Skeleton
{
 class Skeleton
 {

  public static void Main()
  {
   TestEnv.TestEnv te= new TestEnv.TestEnv();

   te.CheckComplainAndAdjustExpected( 0);

   te.Test( true);

   te.CheckComplainAndAdjustExpected( 1);

   System.Console.WriteLine( te.Result());

  }
 }
}
