include <./common.scad>

roll_adapter_diameter_clearence = 5;
roll_adapter_diameter_outer= roll_inner_diameter + roll_adapter_diameter_clearence;
roll_adapter_diameter_inner= roll_inner_diameter - roll_adapter_diameter_clearence;

module roll_adapter(){
    difference(){
       cylinder(roll_adapter_width, d1=roll_adapter_diameter_outer, d2=roll_adapter_diameter_inner);
        
        #
        translate([0,0,-roll_adapter_width])
        cylinder(roll_adapter_width *3, d=roller_width_inner);
    }
}

roll_adapter();