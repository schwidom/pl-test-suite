
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Arrays;

public class JavaUtilLinkedList
{

 public static void main( String[] args)
 {
  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  LinkedList<Integer> ll= new LinkedList<Integer>();

  te.test( 0==ll.size());

  ll.add( 1);
  ll.add( 3);
  
  te.test( ! ll.contains( 0));
  te.test( ll.contains( 1));
  te.test( 2==ll.size());



  te.test( 1 == ll.peek()); // peek, getFirst, element
  te.test( 1 == ll.pop()); // pop, remove, poll, pollFirst
  te.test( 3 == ll.pop());

  te.test( 0==ll.size());

  te.checkComplainAndAdjustExpected( 8);

  ll.add( 1);
  ll.add( 3);

  ListIterator<Integer> lli= ll.listIterator(0);

  int count= 0;
  for( int i : ll)
  {
    te.test( lli.hasNext());
    te.test( i == lli.next());
    count++;
  }

  te.test( 2==count);
  te.test( !lli.hasNext());

  te.test( 1==ll.peek());
  te.test( 1==ll.element());

  te.test( Arrays.asList(1, 3).equals( ll));
  te.test( ll.equals( Arrays.asList(1, 3)));

  ll.clear();

  te.test( Arrays.asList().equals( ll));
  te.test( ll.equals( Arrays.asList()));
  te.test( 0==ll.size());

  te.checkComplainAndAdjustExpected( 13);

  System.out.println( ""+ te.result());
 }
}

