
public class Skeleton
{

 public static void main( String[] args)
 {

  TestCode.te.checkComplainAndAdjustExpected( 0);

  TestCode.te.test( 0==TestCode.testCnt);

  TestCode.test();

  TestCode.te.test( 1==TestCode.testCnt);

  TestCode.te.checkComplainAndAdjustExpected( 4);

  System.out.println( ""+ TestCode.te.result());
 }

}

class TestCode
{
 static int testCnt= 0;
 static TestEnv te= new TestEnv();

 public static void test()
 {
  TestCode.te.test( 0==TestCode.testCnt);
  TestCode.testCnt++;
  TestCode.te.test( 1==TestCode.testCnt);
 }
}

aspect TestAspect
{
}
