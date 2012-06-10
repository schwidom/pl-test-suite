println @{[1, 2, 3]};
println (map { $_ }  @{[1, 2, 3]});
println $#{[map { $_ }  @{[1, 2, 3]}]};
println %{{map { $_ }  @{[1, 2, 3]}}};
#println %{{map { $_ }  @{[1, 2, 3]}}};
#
#my @a= map { $_ }  @{[1, 2, 3]};
#println @a;
#println $a[0 ];
#println $#a;
#
#
