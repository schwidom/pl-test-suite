import java.util.List;
import java.util.Vector;

public class Composite implements AbstractComposite
{
 
 public final List<AbstractComposite> aggregationOfAbstractComposites
  = new Vector<AbstractComposite>();

 public String operate()
 {
  
  StringBuffer sb= new StringBuffer();

  sb.append( "[");
  for( AbstractComposite ac : aggregationOfAbstractComposites)
   sb.append( " "+ ac.operate());
  sb.append( "]");

  return "(composite "+ sb+ ")";
 }
}
