public class ConcreteComponent implements AbstractComponent
{

 private final String identifier;

 public ConcreteComponent( String identifier)
 {
  this.identifier= identifier;
 }

 public String operate()
 {
  return "component "+ identifier;
 }
}
