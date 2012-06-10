package provide skeleton 0.1
package ifneeded testenv 1.0 [list source [file join [pwd] testenv.tcl]]
package require testenv 1.0 

proc {#} args {}

checkComplainAndAdjustExpected 0

# this is a comment
# test false

{#} {
 this is a selfmade block comment
 test false
}

checkComplainAndAdjustExpected 0

puts [ result ]
