// common

minijack_diameter = 6;
minijack_offset = 53.5;
board_height = 1.5;
usb_height = 16;
power_height= 6;
power_width = 10;
power_offset = 11;
spacer_lower = 3;

box_length_inner = 86;
box_width_inner = 59;
box_height_inner = spacer_lower + board_height+ usb_height;

box_border_size = 2;

box_length_outer= box_length_inner + box_border_size*2;
box_width_outer = box_width_inner+ box_border_size*2;
box_height_outer = box_height_inner+ box_border_size*2;

collision_spacer = 0.1;

module box_inner(){
    cube([box_length_inner, box_width_inner, box_height_inner], center = true);
}

module box_whole(){
    difference(){
        translate([0,0,box_border_size + box_height_inner/2])
        difference(){
            minkowski(){
                box_inner();
                sphere(r=box_border_size);
            };
            
            // inner
            box_inner();
        }
        
        slot_depth = box_border_size+collision_spacer *2;
        
        // sd card slot
        sdcard_slot_height = 0.5 + spacer_lower + box_border_size;
        sdcard_slot_radius= 10;
        
        translate([- box_length_outer/2,0,sdcard_slot_height/2 -collision_spacer])
        cylinder(h = sdcard_slot_height, r=sdcard_slot_radius, center= true);
        
        // usb and rj45
        
        translate([
            box_length_inner/2 + box_border_size/2 -collision_spacer, 
            0, 
            box_border_size + usb_height/2 + board_height+spacer_lower])
        cube([slot_depth,box_width_inner -4,usb_height],center=true);
        
        // audio jack
        translate([
            - box_length_inner/2+ minijack_offset,
            -box_width_outer/2 + box_border_size + collision_spacer,
            box_border_size+board_height+spacer_lower + minijack_diameter/2])
        rotate([90,0,0])
        union(){
            cylinder(d = minijack_diameter, h = slot_depth);
            translate([-minijack_diameter/2,0,0])
            cube([minijack_diameter,minijack_diameter/2,slot_depth],center=false);
        }
        
        // power usb
        translate([
        -box_length_inner/2+power_offset-power_width/2,
        -box_width_inner/2 - box_border_size + collision_spacer,
        box_border_size + spacer_lower + board_height])
        cube([power_width,slot_depth,power_height], center=false);
    }
}

// box lower
box_lower_height = box_border_size+ board_height+spacer_lower + minijack_diameter;
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

// view

box_lower();