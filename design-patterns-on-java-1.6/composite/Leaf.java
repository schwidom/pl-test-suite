public class Leaf implements AbstractComposite
{
 private final String info;

 public Leaf( String info){ this.info= info;}

 public String operate()
 {
  
  return "(leaf "+ info+ ")";
 }
}
