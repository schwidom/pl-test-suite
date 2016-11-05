
main :- 

 string_to_list( FILENAME, "work/abc.txt"),
 file_directory_name( FILENAME, DIRECTORY),

 (exists_directory( DIRECTORY) -> true; make_directory( DIRECTORY)),

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 test( (open( FILENAME, write, S), format( S, "abc", []), close( S) ) ),

 test( (open( FILENAME, read, S), get_char( S, a), get_char( S, b), get_char( S, c), get_char( S, end_of_file), close( S) ) ),

 checkComplainAndAdjustExpected( 2),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

