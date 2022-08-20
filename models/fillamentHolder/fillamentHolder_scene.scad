include <./common.scad>
use <./fillamentRollAdapter.scad>
use <./fillamentHolder.scad>

%
translate([ -roll_width/2, 0, roll_center_height])
rotate([0,90,0])
roll();

holder();

translate([ -roll_width/2 - roll_adapter_width/2, 0, roll_center_height])
rotate([0,90,0])
roll_adapter();

mirror([1,0,0])
translate([ -roll_width/2 - roll_adapter_width/2, 0, roll_center_height])
rotate([0,90,0])
roll_adapter();