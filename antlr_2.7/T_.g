
class T_Lexer extends Lexer;

{
 TestEnv te= null;
 public void setTestEnv( TestEnv te){ this.te= te;}
}


X : 'x' { te.test( true);};

class T_Parser extends Parser;

{
 TestEnv te= null;
 public void setTestEnv( TestEnv te){ this.te= te;}
}

r: X { te.test( true);};

