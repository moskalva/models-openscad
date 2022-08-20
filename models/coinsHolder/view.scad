coin_small_diameter=30;
coin_big_diameter=36;

holder_border_width=4;
holder_size_x=coin_small_diameter + holder_border_width*2;
holder_size_y=100;
holder_size_z=30;

module holder1(){
        linear_extrude(holder_size_y, twist=0)
        translate([0,0,holder_size_y])
        difference() {
            circle(holder_size_x/2);
            circle(d=holder_size_x- holder_border_width*2);
            
            translate([-holder_size_x/2,0,0])
            square(holder_size_x);
        }
}
module holder2(){
        linear_extrude(holder_size_y, twist=90)
        translate([0,holder_size_z,0])
        
        rotate([0,0,90])
        difference() {
            circle(d=holder_size_x);
            circle(d=holder_size_x- holder_border_width*2);
            
            translate([-holder_size_x/2,0,0])
            square(holder_size_x);
        }
}

module holder(){
        hull() {
            cylinder(d=holder_size_x, h=1);
            
            translate([-holder_size_x,holder_size_x,-holder_size_y])
            cylinder(d=holder_size_x, h=1);
        }
}

rotate([90,0,0])
holder();