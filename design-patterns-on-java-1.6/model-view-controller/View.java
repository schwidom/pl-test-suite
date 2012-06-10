public class View
{

 private Model m= null;
 public View( Model m){ this.m= m;}

 private Controller c= null;
 public void setController( Controller c){ this.c= c;}

 public void input( String state)
 {
  c.input( state);
 }

 private boolean modelStateChanged= true;

 public void modelStateChanged()
 {
  modelStateChanged= true;
 }

 public String display()
 {
  if( modelStateChanged)
  {
   modelStateChanged= false;
   return "view display: "+ m.getState();
  }
  else
   return "nothing to display";
 }

}
