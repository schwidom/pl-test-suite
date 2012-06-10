public class UseTheStrategyPattern
{

 private AbstractStrategy as= null;

 public void setAbstractStrategy( AbstractStrategy as) { this.as= as; }

 public String operate(){ return as.operate();}

}
