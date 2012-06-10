public class ProxyOfReal implements Abstract
{
 private Real r= null;

 public ProxyOfReal( Real r){ this.r= r;}

 public String operate()
 {
  return "ProxyOfReal determines that (" + r.operate()+ ") and how ("+ r.operate()+ ")";
 }
}
