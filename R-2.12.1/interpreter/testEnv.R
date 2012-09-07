
TestEnv <- function()
{

 this <- list()

 countOk <- 0
 countFail <- 0
 countLatest <- 0

 this$getOk <- function(){ countOk}

 this$test <- function ( b)
 {
  if( b)
  {
   countOk <<- countOk + 1;
  }
  else
  {
   countFail <<- countFail + 1;
   print( 'test failed')
  }
 }

 this$checkComplainAndAdjustExpected <- function( count)
 {
  countTests <- countOk + countFail
  countTestsLocal <- countTests - countLatest

  countLatest <<- countTests

  if( count == countTestsLocal)
  {
   TRUE
  }
  else
  {
   print( sprintf( "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal: %d count: %d", countTestsLocal, count))
   FALSE
  }
  unused <- 9
 }

 this$result <- function()
 {
  sprintf( "tests: ok: %d fail: %d countLatest: %d", countOk, countFail, countLatest);
 }

 this
}



