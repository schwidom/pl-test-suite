// import org.hibernate.*;
// import org.hibernate.cfg.*;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.Session;
import java.util.List;

public class KeyValuePairTest
{

 public static void main( String[] args) throws Exception
 {
 
// without extra arguments to org.hibernate.cfg.Configuration.configure there must exist a hibernate configuration file named hibernate.cfg.xml 

  final SessionFactory sessionFactory= new Configuration().configure( "KeyValuePairTest.hibernate.cfg.xml").buildSessionFactory();

  {
 
   final Session session= sessionFactory.getCurrentSession();
 
   session.beginTransaction();
 
   //KeyValuePair kvp= new KeyValuePair(){{ setKey( "a"); setValue( "b");}};
   
   {
    KeyValuePair kvp= new KeyValuePair();
 
    kvp.setKey( "a");
    kvp.setValue( "b");
 
    session.save( kvp);
   }
 
   {
    KeyValuePair kvp= new KeyValuePair();
 
    kvp.setKey( "c");
    kvp.setValue( "d");
 
    session.save( kvp);
   }
 
   session.getTransaction().commit(); // performs: session.close();
  }

  TestEnv te= new TestEnv();

  te.checkComplainAndAdjustExpected( 0);

  {
 
   final Session session= sessionFactory.getCurrentSession();
 
   session.beginTransaction();

   List result = session.createQuery("from KeyValuePair").list();

   te.test( "[a:b, c:d]".equals ( ""+ result));

  }

  te.checkComplainAndAdjustExpected( 1);

  System.out.println( "result: "+ te.result());
 }
}
