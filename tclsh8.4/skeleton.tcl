package provide skeleton 0.1
package ifneeded testenv 1.0 [list source [file join [pwd] testenv.tcl]]
package require testenv 1.0 

checkComplainAndAdjustExpected 0

test true

checkComplainAndAdjustExpected 1

puts [ result ]
