
public class TestEnv
{
 int countOk= 0;
 int countFail= 0;
 int countLatest= 0;

 public void test( boolean b)
 {
  if( b)
  {
   countOk+= 1;
  }
  else
  {
   countFail+= 1;
   new Throwable( "test failed").printStackTrace();
  }
 }

 public boolean checkComplainAndAdjustExpected( int count)
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
   new Throwable( "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal:" + countTestsLocal + " count: "+ count).printStackTrace();
   return false;
  }

 }

 public String result()
 {
  return "tests: ok: "+ countOk+ " fail: "+ countFail+ " countLatest: "+ countLatest;
 }

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);
  te.test( true);
  te.test( true);
  te.checkComplainAndAdjustExpected( 2);
  te.test( true);
  te.test( true);
  te.test( true);
  te.checkComplainAndAdjustExpected( 3);
  System.out.println( ""+ te.result());
 }
}

