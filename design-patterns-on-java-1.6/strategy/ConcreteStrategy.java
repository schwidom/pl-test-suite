public class ConcreteStrategy implements AbstractStrategy
{
 
 private final String identifier;

 public ConcreteStrategy( String identifier)
 {
  this.identifier= identifier;
 }

 public  String operate(){ return identifier+ " operates";}
}
