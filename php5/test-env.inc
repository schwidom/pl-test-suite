<?
 class TestEnv
 {
    # function foo()
  private $countOk= 0;
  private $countFail= 0;
  private $countLatest= 0;

  function test( $b)
  {
   if( $b)
    $this->countOk+= 1;
   else
   {
    $this->countFail+=1;
    echo "test failed\n";
# TODO debug_backtrace
   }
  }

  function checkComplainAndAdjustExpected( $count)
  {
   $countTests= $this->countOk + $this->countFail;
   $countTestsLocal= $countTests - $this->countLatest;

   $this->countLatest = $countTests;

   if( $count == $countTestsLocal)
   {
    return true;
   }
   else
   {
    echo "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal:" . $countTestsLocal . " count: ". $count. "\n"; # TODO: debug_backtrace
    return false;
   }

  }

  function result()
  {
   return "tests: ok: ". $this->countOk. " fail: ". $this->countFail. " countLatest: ". $this->countLatest;
  }
 }
?>
