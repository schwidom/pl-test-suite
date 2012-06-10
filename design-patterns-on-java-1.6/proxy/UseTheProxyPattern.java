public class UseTheProxyPattern
{

 private Abstract a= null;

 public void setAbstract( Abstract a) { this.a= a; }

 public String operate(){ return a.operate();}

}
