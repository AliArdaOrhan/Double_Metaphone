PL/SQL Developer Test script 3.0
7
declare
  show_output boolean := sys.diutil.int_to_bool(:show_output);
begin
  plunit.run_all_tests(owner => :owner,
                       package_name => :package_name,
                       show_output => show_output);
end;
3
owner
1
crane_ms_12
5
package_name
1
p_double_metaphone_test
5
show_output
1
1
3
0
