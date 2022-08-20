roll_diameter = 200;
roll_inner_diameter = 58;
roll_width = 72; 

roller_diameter= 22;
roller_diameter_inner= 10;
roller_width_inner=8;
roller_width = roller_width_inner + 2;

roll_center_height= roll_diameter/2 + 20;


holder_length = 160 ;
roll_adapter_width=10;

module roll() {
    difference(){
        cylinder(roll_width, d=roll_diameter);
        translate([0,0,-1])
            cylinder(roll_width+2, d=roll_inner_diameter);
    }
}

module roller(){
       cylinder(roller_width, d=roller_diameter);
}