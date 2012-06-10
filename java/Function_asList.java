import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Vector;

import java.util.List;

import java.util.Arrays;


public class Function_asList
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  te.test( Arrays.asList( 1, 2, 3).equals( Arrays.asList( new Integer[]{ 1, 2, 3})));
  te.test( ! Arrays.asList( 1, 2, 3).equals( Arrays.asList( new int[]{ 1, 2, 3})));

  te.checkComplainAndAdjustExpected( 2);

  ArrayList<Integer> al= new ArrayList<Integer>();
  LinkedList<Integer> ll= new LinkedList<Integer>();
  Vector<Integer> v= new Vector<Integer>();

  for( int i= 0; i< 5; i++)
  {
   al.add( i);
   ll.add( i);
   v.add( i);
  }

  List l= Arrays.asList( 0, 1, 2, 3, 4);

  te.test( l.equals( al));
  te.test( l.equals( ll));
  te.test( l.equals( v));

  te.test( al.equals( l));
  te.test( ll.equals( l));
  te.test( v.equals( l));

  te.checkComplainAndAdjustExpected( 6);

  System.out.println( ""+ te.result());
 }
}

