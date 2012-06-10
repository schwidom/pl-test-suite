package provide skeleton 0.1
package ifneeded testenv 1.0 [list source [file join [pwd] testenv.tcl]]
package require testenv 1.0 

checkComplainAndAdjustExpected 0

test [expr {1==1}]
test [expr {0==[expr {1==0}]}]
test [expr {3==[expr {1 + 2}]}]
test [expr {{abc}=="abc"}]
test [expr "{abc}=={abc}"]
test [expr {0==[expr "{abc}=={abd}"]}]

checkComplainAndAdjustExpected 6

puts [ result ]
