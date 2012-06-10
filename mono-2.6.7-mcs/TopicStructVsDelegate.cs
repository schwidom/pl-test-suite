namespace TopicStructVsDelegate
{
 class TopicStructVsDelegate
 {

  delegate void dlgt_vv();
  
  struct Struct
  {
   public int i;
   public void foo() { i = 1; }
  }
  
  static void Main(string[] args)
  {
 
   TestEnv.TestEnv te= new TestEnv.TestEnv();

   te.CheckComplainAndAdjustExpected( 0);

   Struct s = new Struct();
 
   dlgt_vv aDlgt0 = s.foo;
   dlgt_vv aDlgt = s.foo;
 
   te.Test( 0== ( (Struct)aDlgt.Target).i);
 
   Struct sCopy1= (Struct) aDlgt.Target; 
 
   te.Test( s.Equals( sCopy1)); // bb86f83d6448458db598c5fa849441c8
   te.Test( aDlgt.Target.Equals( ( (dlgt_vv) s.foo).Target)); // 6494647464964967a30d5f91c399c818
 
   te.Test( ! aDlgt.Equals( ( (dlgt_vv) s.foo)));
   te.Test( ! aDlgt0.Equals( aDlgt)); 
 
   aDlgt();
   //s.foo(); // not the same Result
 
   Struct sCopy2= (Struct) aDlgt.Target; // 109ea2c9d5584c15854be335d0b81884

   te.Test( ! s.Equals( sCopy2)); // bb86f83d6448458db598c5fa849441c8
   te.Test( ! aDlgt.Target.Equals( ( (dlgt_vv) s.foo).Target)); // 6494647464964967a30d5f91c399c818
 
   te.Test( 0 == s.i);
 
   te.Test( 0 == sCopy1.i);
 
   te.Test( 1 == sCopy2.i); // 109ea2c9d5584c15854be335d0b81884
 
   te.CheckComplainAndAdjustExpected( 10);

   System.Console.WriteLine( te.Result());
  }
 }
}

