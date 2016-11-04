
main :- 

 string_to_list( FILENAME, "work/abc.txt"),
 file_directory_name( FILENAME, DIRECTORY),

 (exists_directory( DIRECTORY) -> true; make_directory( DIRECTORY)),

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (open( FILENAME, write, S1), format( S1, "abc", []), close( S1) -> testOk; testFail),

 (open( FILENAME, read, S2), get_char( S2, a), get_char( S2, b), get_char( S2, c), get_char( S2, end_of_file), close( S2) -> testOk; testFail),

 checkComplainAndAdjustExpected( 2),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

