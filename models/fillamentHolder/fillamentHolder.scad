include <./common.scad>

holder_side_width=roller_width + 3;
holder_side_clearence=20;

holder_width = roll_width + (holder_side_clearence*2) + (holder_side_width * 2);
holder_base_height = 10;


module holder_tower() {
    tower_roll_center_height = roll_center_height - holder_base_height;
    holder_tower_height =  tower_roll_center_height + roller_diameter * 2;
    
    rotate([90, 0, 90])
    intersection(){
        
        translate([-holder_length/ 2, 0, -holder_side_width])
            cube([holder_length, roll_center_height, holder_side_width *2]);
        union(){
            union() {
                linear_extrude(holder_side_width)
                polygon([
                    [-roller_diameter/2 , roll_center_height - holder_side_width /2 ],
                    [-roller_diameter/2 - holder_side_width /2, roll_center_height ],
                    [-holder_length/2, 0],
                    [-holder_length /2 + holder_side_width, 0]
                ]);
                
                linear_extrude(holder_side_width)
                polygon([
                    [roller_diameter/2 , roll_center_height - holder_side_width /2 ],
                    [roller_diameter/2 + holder_side_width /2, roll_center_height ],
                    [holder_length/2, 0],
                    [holder_length /2 - holder_side_width, 0]
                ]);
                              
                linear_extrude(holder_side_width)
                polygon([
                    [- holder_side_width /2, tower_roll_center_height - roller_diameter/2],
                    [ holder_side_width /2, tower_roll_center_height - roller_diameter/2],
                    [holder_side_width /2, 0],
                    [- holder_side_width /2, 0]
                ]);
                
                translate([-holder_side_width/2,0,0])
                rotate([0,90,0])
                linear_extrude(holder_side_width)
                polygon([
                    [ holder_side_width, 0],
                    [0, 0],
                    [0, holder_side_width * 2]
                ]);
            }
            
            translate([0, tower_roll_center_height, 0])
                difference(){
                    hull(){
                        translate([0, roller_diameter, 0])
                            cylinder(holder_side_width, d= roller_diameter + holder_side_width );
                        cylinder(holder_side_width, d= roller_diameter + holder_side_width );
                    }
                    translate([0, 0, -1])
                    hull(){
                        translate([0, roller_diameter, 0])
                            roller();
                        roller();
                    }
                    
                   translate([0,0,-roller_width])
                    hull(){
                        translate([0, roller_diameter, 0])
                    cylinder(roller_width *3, d=roller_diameter_inner);
                    cylinder(roller_width *3, d=roller_diameter_inner);
                    }
                }
            }
    }
}

module holder_base(){
    
    translate([-holder_width/2, -holder_length/2, 0])
        cube([holder_side_width, holder_length, holder_base_height]);
    
    translate([holder_width/2 - holder_side_width, -holder_length/2, 0])
        cube([holder_side_width, holder_length, holder_base_height]);
    
    
    translate([-holder_width/2 , -holder_length/2, 0])
        cube([holder_width,  holder_side_width, holder_base_height]);
    translate([-holder_width/2 , holder_length/2- holder_side_width , 0])
        cube([holder_width,  holder_side_width, holder_base_height]);
    translate([-holder_width/2 , - holder_side_width/2 , 0])
        cube([holder_width,  holder_side_width, holder_base_height]);
}

module holder() {
        union() {
            holder_base();
                                    
            translate([holder_width/2 - holder_side_width, 0, holder_base_height])
                holder_tower();
            
            mirror([1, 0, 0])
            translate([holder_width/2 - holder_side_width, 0, holder_base_height])
                holder_tower();
        }
}
%
translate([ -roll_width/2, 0, roll_center_height])
rotate([0,90,0])
roll();

holder();
