
public class AdviceAroundProceed
{

 public static void main( String[] args)
 {

  TestCode.te.checkComplainAndAdjustExpected( 0);

  TestCode.te.test( 0==TestCode.testCnt);

  TestCode.test();

  TestCode.te.test( 3==TestCode.testCnt);

  TestCode.te.checkComplainAndAdjustExpected( 8);

  System.out.println( ""+ TestCode.te.result());
 }

}

class TestCode
{
 static int testCnt= 0;
 static TestEnv te= new TestEnv();

 public static void test()
 {
  TestCode.te.test( 1==TestCode.testCnt);
  TestCode.testCnt++;
  TestCode.te.test( 2==TestCode.testCnt);
 }
}

aspect TestAspect
{

 void around(): call( void TestCode.test())
 {
  TestCode.te.test( 0==TestCode.testCnt);
  TestCode.testCnt++;
  TestCode.te.test( 1==TestCode.testCnt);

  proceed();

  TestCode.te.test( 2==TestCode.testCnt);
  TestCode.testCnt++;
  TestCode.te.test( 3==TestCode.testCnt);

 }

}

// diff-info : from AdviceAround.java

