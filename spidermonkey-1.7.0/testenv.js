
var testenv= (function()
 {

  ret= new Object();
  private_fields= new Object();

  private_fields.countOk= 0;
  private_fields.countFail= 0;
  private_fields.countLatest= 0;

  ret.test= (function( b)
   {
    if( b) private_fields.countOk+=1;
    else 
    {
     private_fields.countFail+= 1;
     print( 'test failed');
    }
   }
  );

  ret.checkComplainAndAdjustExpected= (function( count)
   {
    countTests= private_fields.countOk + private_fields.countFail;
    countTestsLocal= countTests - private_fields.countLatest;

    private_fields.countLatest= countTests;

    if( count == countTestsLocal)
    {
     return true;
    }
    else
    {
     print( "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal:" + countTestsLocal + " count: "+ count);
     return false;
    }
   }
  );

  ret.result= (function()
   {
    return "tests: ok: "+ private_fields.countOk+ " fail: "+ private_fields.countFail+ " countLatest: "+ private_fields.countLatest;
   }
  );

  return ret;
 }
);

