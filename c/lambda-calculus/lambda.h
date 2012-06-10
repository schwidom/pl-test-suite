
struct stacklist
{
 struct stacklist *previous;

 const char const *type;
 // "P" for function parameters
 // "V" for function variables
 // "R" for function returnvalues
 // "F" for functions
 
 char *key;
 void *value;
};

extern const char const * SL_P;
extern const char const * SL_V;
extern const char const * SL_R;
extern const char const * SL_F;

struct stacklist *sl_make( const char const * type, char* key, void* value);

struct stacklist *sl_push( struct stacklist *sl_previous, const char const * type, char* key, void* value);

struct stacklist *sl_insert( struct stacklist *sl_current, const char const * type, char* key, void* value);

struct stacklist* sl_search_type( struct stacklist *sl_current, int nth, const char const * type);

struct stacklist* sl_search_key( struct stacklist *sl_current, int nth, const char const * key);

struct stacklist* sl_search_type_and_key( struct stacklist *sl_current, int nth, const char const * type, const char const * key);

int sl_call( struct stacklist *sl_current);

