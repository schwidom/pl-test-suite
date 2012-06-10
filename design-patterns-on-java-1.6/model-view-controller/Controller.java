public class Controller
{

 private Model m= null;
 public Controller( Model m){ this.m= m;}

 private View v= null;
 public void setView( View v){ this.v= v;}

 public void input( String state)
 {
  m.setState( "changed state: "+ state);
  v.modelStateChanged();
 }
 

}
