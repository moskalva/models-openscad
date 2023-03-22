include <./common.scad>

branch_length = 70;
branch_width = 10;

holder_border_width = 2;

branch_height = holder_border_width * 2;
branch_softness = 1;

base_height = 8;
base_radius = branch_width*2;
coin_rotation = 25;

branches_number = 3;


module branch(coin_diameter){
    module coin(){#
        cylinder(h = coin_height, d= coin_diameter);
    }
    
    translate([0,-branch_length,0])
    union(){
        
        // Holder
        holder_diameter = coin_diameter + holder_border_width*2;
        holder_height = coin_height + holder_border_width*2;
        rotate([0,0,coin_rotation])
        translate([0,holder_height/2,holder_diameter/2 + holder_border_width])
        rotate([90,0,0])
        difference(){
            cylinder(h= holder_height, d= holder_diameter);

            translate([0,0,-0.1])
            cylinder(h= holder_height + 0.2, d = coin_diameter - holder_border_width*2);

            translate([0,0,holder_border_width])
            coin();

            rotate([90,0,0])
            translate([-holder_diameter/2,-0.1,-holder_diameter/2])
            cube([holder_diameter, holder_height+0.2, holder_diameter/2]);
        }
        
        // Branch
        translate([
            -branch_width/2+branch_softness,
            branch_softness - holder_border_width,
            branch_softness])
        minkowski(){
            sphere(r = branch_softness);
            cube([
                branch_width-branch_softness*2,
                branch_length,
                branch_height-branch_softness*2]);
        }
    }
}

module branch_level(coin_diameter){
    difference(){
        union(){
            // branches
            for(branch_number = [0:branches_number-1]){
                branch_angle = 360/branches_number * branch_number;
                rotate([0,0,branch_angle])
                branch(coin_diameter);
            }
            // Branch base 
            cylinder(h= branch_height, r = base_radius);
            // Branch base top
            translate([0,0, branch_height])
            cylinder(h= base_height-branch_height, r1 = base_radius, r2= nut_diameter_outer/2);
        }
        // Bolt hole
        #
        translate([0,0,-0.1])
        cylinder(h=base_height+ 0.2, d= nut_diameter_outer+1);
    }
}

branch_level(coin_small_diameter);