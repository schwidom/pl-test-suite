
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( options()$show.error.messages)
options( show.error.messages=FALSE)
error= try( stop( "errmessage1"))
te$test( 'character' == mode( error))
te$test( "Error in try(stop(\"errmessage1\")) : errmessage1\n" == error)
te$test( "Error in try(stop(\"errmessage1\")) : errmessage1\n" == geterrmessage())
options( show.error.messages=TRUE)

error= try( stop( "errmessage2"), silent=TRUE)
te$test( 'character' == mode( error))
te$test( "Error in try(stop(\"errmessage2\"), silent = TRUE) : errmessage2\n" == error)
te$test( "Error in try(stop(\"errmessage2\"), silent = TRUE) : errmessage2\n" == geterrmessage())

error= try( {}, silent=TRUE)
te$test( is.null( error))

res = 0
error = tryCatch( stop( 'a'), error= function( x) c( 3, x), finally=(function(){ res <<- 2})())
te$test( 3 == error[ 1])
te$test( 'a' == error$message)
te$test( 2 == res)
te$test( 'a' == geterrmessage())

te$checkComplainAndAdjustExpected( 12)

# see also:

print( te$result())

