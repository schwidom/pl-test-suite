
public class Parameters
{

 public static void main( String[] args)
 {

  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  te.test( 0==TestCode.testCnt);

  TestCode.test( te);

  te.test( 3==TestCode.testCnt);

  te.checkComplainAndAdjustExpected( 8);

  System.out.println( ""+ te.result());
 }
}

class TestCode
{

 static int testCnt= 0;

 public static void test( TestEnv te)
 {
  te.test( 1==TestCode.testCnt);
  TestCode.testCnt++;
  te.test( 2==TestCode.testCnt);
 }
}

aspect TestAspect
{

 pointcut p( TestEnv te): (call( void TestCode.test( TestEnv))) && args( te);

 before( TestEnv te): p( te) 
 {
  te.test( 0==TestCode.testCnt);
  TestCode.testCnt++;
  te.test( 1==TestCode.testCnt);
 }

 after( TestEnv te): p( te)
 {
  te.test( 2==TestCode.testCnt);
  TestCode.testCnt++;
  te.test( 3==TestCode.testCnt);
 }
}

// diff-info : from Pointcut.java
