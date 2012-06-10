
public class Comment
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

// this is a comment

/*
 this is a comment
*/

  te.checkComplainAndAdjustExpected( 0);

  System.out.println( ""+ te.result());
 }
}

