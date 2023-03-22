include <./common.scad>
use <./tree_base.scad>
use <./tree_top.scad>
use <./tree_level.scad>


level_rotation_angle = 25;
level_elevation = 9;
levels_number = 10;

level_base_elevation = 40;

//Base
tree_base();

// Branches
translate([0,0,level_base_elevation])
for(level = [0:levels_number-1]){
    translate([0,0,level * level_elevation])
    rotate([0,0,level * level_rotation_angle])
    branch_level(coin_big_diameter);
}

// Top
tree_top_elevation = level_base_elevation + levels_number * (level_elevation);
translate([0,0,  tree_top_elevation])
tree_top();