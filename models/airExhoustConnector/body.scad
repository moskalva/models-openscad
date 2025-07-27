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

screw_length=5;
screw_twists=2;
screw_chamfer=2;

collision_space=0.1;

module thread(
    diameter,
    screw_length,
    height,
    chamfer,
    twists){
        
    diameter_c = diameter+chamfer;
    screw_length_c =screw_length+chamfer;
    base_diameter = diameter_c - screw_length_c;
    disposition = diameter_c/2 - base_diameter/2;
    twist= 360 * twists;
        
    union(){
        
        cylinder(h=height,d=diameter-screw_length*2);
        
        difference(){
            linear_extrude(height, twist=twist,scale=1)
            translate([disposition, 0, 0])
                circle(d=base_diameter);
            
            translate([0,0,-collision_space])
            difference(){
                cylinder(h=height+collision_space*2,d=diameter*2);
                
                translate([0,0,-collision_space])
                cylinder(h=height+collision_space*4,d=diameter);
            }
        }
    }
}

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


difference(){
    cylinder(h = height_bottom, d = diameter_bottom_outer);
    translate([0,0,-collision_space]) 
        thread(diameter_bottom_inner,screw_length,height_bottom+collision_space*2,screw_chamfer,screw_twists);
} 




