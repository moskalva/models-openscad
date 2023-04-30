include <./common.scad>
use <./whole.scad>

module box_lower(){
    difference(){
        box_whole();
        
        translate([0,0,box_height_outer/2 + box_lower_height])
        cube([
            box_length_outer+collision_spacer, 
            box_width_outer +collision_spacer,
            box_height_outer +collision_spacer
        ], center= true);
    }
}
box_lower();