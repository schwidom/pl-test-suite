// $ANTLR 2.7.7 (20081216): "Aabcc_1_.g" -> "Aabcc_1_Parser.java"$

import antlr.TokenBuffer;
import antlr.TokenStreamException;
import antlr.TokenStreamIOException;
import antlr.ANTLRException;
import antlr.LLkParser;
import antlr.Token;
import antlr.TokenStream;
import antlr.RecognitionException;
import antlr.NoViableAltException;
import antlr.MismatchedTokenException;
import antlr.SemanticException;
import antlr.ParserSharedInputState;
import antlr.collections.impl.BitSet;

public class Aabcc_1_Parser extends antlr.LLkParser       implements Aabcc_1_LexerTokenTypes
 {

 TestEnv te= null;
 public void setTestEnv( TestEnv te){ this.te= te;}

protected Aabcc_1_Parser(TokenBuffer tokenBuf, int k) {
  super(tokenBuf,k);
  tokenNames = _tokenNames;
}

public Aabcc_1_Parser(TokenBuffer tokenBuf) {
  this(tokenBuf,1);
}

protected Aabcc_1_Parser(TokenStream lexer, int k) {
  super(lexer,k);
  tokenNames = _tokenNames;
}

public Aabcc_1_Parser(TokenStream lexer) {
  this(lexer,1);
}

public Aabcc_1_Parser(ParserSharedInputState state) {
  super(state,1);
  tokenNames = _tokenNames;
}

	public final void r() throws RecognitionException, TokenStreamException {
		
		
		try {      // for error handling
			{
			int _cnt7=0;
			_loop7:
			do {
				if ((LA(1)==A)) {
					match(A);
				}
				else {
					if ( _cnt7>=1 ) { break _loop7; } else {throw new NoViableAltException(LT(1), getFilename());}
				}
				
				_cnt7++;
			} while (true);
			}
			match(B);
			{
			int _cnt9=0;
			_loop9:
			do {
				if ((LA(1)==C)) {
					match(C);
				}
				else {
					if ( _cnt9>=1 ) { break _loop9; } else {throw new NoViableAltException(LT(1), getFilename());}
				}
				
				_cnt9++;
			} while (true);
			}
			match(END);
			te.test( true);
		}
		catch (RecognitionException ex) {
			reportError(ex);
			recover(ex,_tokenSet_0);
		}
	}
	
	
	public static final String[] _tokenNames = {
		"<0>",
		"EOF",
		"<2>",
		"NULL_TREE_LOOKAHEAD",
		"A",
		"B",
		"C",
		"END"
	};
	
	private static final long[] mk_tokenSet_0() {
		long[] data = { 2L, 0L};
		return data;
	}
	public static final BitSet _tokenSet_0 = new BitSet(mk_tokenSet_0());
	
	}
