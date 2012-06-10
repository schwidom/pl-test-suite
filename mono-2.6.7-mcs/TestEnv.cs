namespace TestEnv
{
 class TestEnv
 {

  private int countOk = 0;
  private int countFail = 0;
  private int countLatest = 0;

  public void Test( bool b)
  {
   if( b)
   {
    countOk+= 1;
   }
   else
   {
    countFail+= 1;
    System.Console.WriteLine( "test failed");
    // ggf. stacktrace ausgeben
   }
  }

  public bool CheckComplainAndAdjustExpected( int count)
  {
   int countTests= countOk + countFail;
   int countTestsLocal= countTests - countLatest;

   countLatest= countTests;

   if( count == countTestsLocal)
   {
    return true;
   }
   else
   {
    System.Console.WriteLine( "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal:" + countTestsLocal + " count: "+ count);
    // ggf. stacktrace ausgeben
    return false;
   }
  }

  public string Result()
  {
   return "tests: ok: "+ countOk+ " fail: "+ countFail+ " countLatest: "+ countLatest;
  }
 }
}
