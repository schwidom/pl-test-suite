package provide skeleton 0.1
package ifneeded testenv 1.0 [list source [file join [pwd] testenv.tcl]]
package require testenv 1.0 

checkComplainAndAdjustExpected 0

test [expr {1==[catch {not_existing_cmd} err]}]
test [expr { {invalid command name "not_existing_cmd"} == $err} ]

test [expr {2==[catch {return "return_value"} err]}]
test [expr { {return_value} == $err} ]

test [expr {1==[catch {error "error_value"} err]}]
test [expr { {error_value} == $err} ]

test [expr {0==[catch {} err]}]
test [expr { {} == $err} ]

proc do_nothing {} {}

test [expr {0==[catch {do_nothing} err]}]
test [expr { {} == $err} ]

proc returning_value {} {return "return_value"}

test [expr {2==[catch {return [returning_value]} err]}]
test [expr { {return_value} == $err} ]

test [expr {0==[catch {returning_value} err]}]
test [expr { {return_value} == $err} ]

proc throwing_error {} {error "error_value"}

test [expr {1==[catch {throwing_error} err]}]
test [expr { {error_value} == $err} ]

checkComplainAndAdjustExpected 16

puts [ result ]
