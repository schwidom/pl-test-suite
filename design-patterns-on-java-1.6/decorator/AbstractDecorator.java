import java.util.List;
import java.util.Vector;

public abstract class AbstractDecorator implements AbstractComponent
{

 private final AbstractComponent acToDecorate;

 public AbstractDecorator( AbstractComponent acToDecorate)
 {
  this.acToDecorate= acToDecorate;
 }

 public String operate()
 {
  
  return ""+ acToDecorate.operate();
 }
}
