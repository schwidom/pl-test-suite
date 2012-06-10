public class ConcreteDecorator extends AbstractDecorator
{

 private final String identifier;

 public ConcreteDecorator( String identifier, AbstractComponent acToDecorate)
 {
  super( acToDecorate);
  this.identifier= identifier;
 }

 public String operate()
 {
  return "("+ identifier+ " decorates "+ super.operate()+ ")";
 }
}
