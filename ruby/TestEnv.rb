#!/usr/bin/ruby

class TestEnv

 def initialize
  @countOk= 0
  @countFail= 0
  @countLatest= 0
  @countRelativeExpected= 0
 end

 def test( b)
  if b
   @countOk+=1
   true
  else
   @countFail+=1
   print( "test failed\n")
   print( begin; raise "x"; rescue => detail; detail.backtrace.join", \n"; end+ "\n")
   false
  end
 end

 def checkComplainAndAdjustExpected( count)
  countTests= @countOk + @countFail
  countTestsLocal= countTests - @countLatest

  @countLatest= countTests

  if count == countTestsLocal
   true
  else
   print( "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal:", countTestsLocal, " count: ", count, "\n")
   print( begin; raise "x"; rescue => detail; detail.backtrace.join", \n"; end+ "\n")
   false
  end

 end

 def result
  "tests: ok: #{@countOk} fail: #{@countFail} countLatest: #{@countLatest}"
 end
end

