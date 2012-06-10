
class Aabcc_3_Lexer extends Lexer;

{
 TestEnv te= null;
 public void setTestEnv( TestEnv te){ this.te= te;}
}


A : 'a' { te.test( true);};
B : 'b' { te.test( true);};
C : 'c' { te.test( true);};
END : ';' { te.test( true);};

class Aabcc_3_Parser extends Parser;

{
 TestEnv te= null;
 public void setTestEnv( TestEnv te){ this.te= te;}
}

r: A ra B C rc END { te.test( true);};

ra: | A ra ;
rc: | C rc ;

