#!/usr/bin/ruby


te= TestEnv.new()

te.checkComplainAndAdjustExpected( 0)

te.test( true)


END {
 te.checkComplainAndAdjustExpected( 2)
 print( te.result+ "\n")
}

END{
 te.test(true)
}

BEGIN{
 load "TestEnv.rb"
}


#te.checkComplainAndAdjustExpected( 0)

#te.test( true)

#te.checkComplainAndAdjustExpected( 1)

