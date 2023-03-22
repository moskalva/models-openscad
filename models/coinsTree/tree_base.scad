include <./common.scad>


tree_base_height= 32;
tree_base_height_bottom = 12;
tree_base_bottom_height= 2;

tree_base_radius = roller_diameter/2 + 4;
tree_base_radius_bottom = 40;

module tree_base(){
    difference(){
        union(){

            translate([0,0,tree_base_height_bottom])
            cylinder(h= tree_base_height - tree_base_height_bottom, r1 = tree_base_radius_bottom, r2 = tree_base_radius);

            cylinder(h= tree_base_height_bottom, r = tree_base_radius_bottom);
        }
        
        #
        translate([0,0,tree_base_bottom_height])
        cylinder(h=tree_base_height,d=  roller_diameter);
    }
}


tree_base();