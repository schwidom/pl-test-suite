public class Array
{
 public static void main( String[] args)
 {
  
  TestEnv te= new TestEnv();
  te.checkComplainAndAdjustExpected( 0);

  int[][][] ia= new int[2][3][5];
  te.test( (2 == ia.length));
  te.test( (3 == ia[0 ].length));
  te.test( (5 == ia[0 ][0].length));

  te.checkComplainAndAdjustExpected( 3);

  int [] [] ia2= new int [6] [7] ;

  ia[0] = ia2;
  te.test( (6 == ia[0 ].length));
  te.test( (7 == ia[0 ][0].length));
  te.test( (3 == ia[1 ].length));
  te.test( (5 == ia[1 ][0].length));

  te.checkComplainAndAdjustExpected( 4);

  System.out.println( ""+ te.result());
 }
}

