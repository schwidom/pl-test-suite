public class KeyValuePair
{

 Long id;

 private void setId( Long id) { this.id = id;}
 public Long getId() { return id;}

 String key;

 public void setKey( String key){ this.key= key;}
 public String getKey(){ return key;}

 String value;

 public void setValue( String value){ this.value= value;}
 public String getValue(){ return value;}

 public String toString(){ return key+ ":"+ value;}

}
