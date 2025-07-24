$fs=0.1;

height_top=30;
height_middle=100;
height_bottom=30;

wall_width=3;

diameter_top_outer=98;
diameter_top_inner=diameter_top_outer-wall_width;
diameter_bottom_inner=150;
diameter_bottom_outer=diameter_bottom_inner+wall_width;

top_diamater_scew = 2;

screw_height = 3;
screw_length=10;

collision_space=0.1;

translate([0,0,height_middle+height_bottom]) 
difference(){
    cylinder(h = height_top, d1 = diameter_top_outer, d2 = diameter_top_outer - top_diamater_scew);
    translate([0,0,-collision_space]) 
        cylinder(h = height_top+collision_space*2, d = diameter_top_inner - top_diamater_scew);
} 

translate([0,0,height_bottom]) 
difference(){
    cylinder(h = height_middle, d1 = diameter_bottom_outer, d2 = diameter_top_outer);
    translate([0,0,-collision_space]) 
        cylinder(h = height_middle+collision_space*2, d1 = diameter_bottom_inner, d2 = diameter_top_inner);
} 

module thread(){
    module thread_section(){
        linear_extrude(height = height_bottom, center = false, twist = 90)
        translate([diameter_bottom_outer/2-screw_length/2-wall_width, 0, 0])
            circle(d=screw_length+wall_width);
    }
    thread_section();
}
!
thread();

difference(){
    cylinder(h = height_bottom, d = diameter_bottom_outer);
    translate([0,0,-collision_space]) 
        cylinder(h = height_bottom+collision_space*2, d = diameter_bottom_inner);
} 