// common

board_height = 1.5;

usb_height = 16;

screen_width=22;
screen_width_outer=24;
screen_height = 12;
screen_height_outer=26;
screen_inner_offset=6;
screen_screw_diameter=2;
screen_screew_offset=2;

minijack_diameter = 6;
minijack_offset = 53.5;

spacer_lower = 3;

box_length_inner = 86;
box_width_inner = 59;
box_height_inner = spacer_lower + board_height + minijack_diameter+screen_height_outer;

box_border_size = 2;

box_length_outer= box_length_inner + box_border_size*2;
box_width_outer = box_width_inner+ box_border_size*2;
box_height_outer = box_height_inner+ box_border_size*2;

power_height= 6;
power_width = 10;
power_offset = 11;

hdmi_height = power_height;
hdmi_width = 20;
hdmi_offset= 33; 

low_vent_rows=14;
low_vent_length=15;
low_vent_width = 2;
low_vent_spread_x=4;
low_vent_spread_y=2;

screw_offset_y = 3.5;
screw_offset_x_front = 3.5;
screw_distance_x= 58;
screw_radius=1;

collision_spacer = 0.1;

module box_inner(){
    cube([box_length_inner, box_width_inner, box_height_inner], center = true);
}

module screen_screw_hole(){
translate([
    -box_length_outer/2-collision_spacer,
   0,
    box_height_inner])
rotate([0,90,0])
cylinder(h=box_border_size+collision_spacer*2,d=screen_screw_diameter);
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
        
        // hdmi
        translate([
            -box_length_inner/2+hdmi_offset-hdmi_width/2,
            -box_width_inner/2 - box_border_size + collision_spacer,
            box_border_size + spacer_lower + board_height])
        cube([hdmi_width,slot_depth,hdmi_height], center=false);
        
        // bottom ventilation gaps
        // low_vent_total_length = low_vent_rows * (low_vent_spread_y + low_vent_width);
        // for(i=[0:low_vent_rows]){
        //     translate([low_vent_total_length/2 - low_vent_spread_x*i, low_vent_spread_y,0])
        //     cube([low_vent_width,low_vent_length,box_border_size+collision_spacer*2]);
            
        //     mirror([0,1,0])
        //     translate([low_vent_total_length/2 - low_vent_spread_x*i, low_vent_spread_y,0])
        //     cube([low_vent_width,low_vent_length,box_border_size+collision_spacer*2]);            
        // }
        
        // screw holes        
        translate([-box_length_inner/2+screw_offset_x_front,box_width_inner/2-screw_offset_y,-collision_spacer])
        cylinder(r=screw_radius,h=box_border_size+collision_spacer*2);
        
        translate([-box_length_inner/2+screw_offset_x_front + screw_distance_x,box_width_inner/2-screw_offset_y,-collision_spacer])
        cylinder(r=screw_radius,h=box_border_size+collision_spacer*2);
        
        translate([-box_length_inner/2+screw_offset_x_front,-box_width_inner/2+screw_offset_y,-collision_spacer])
        cylinder(r=screw_radius,h=box_border_size+collision_spacer*2);
        
        translate([-box_length_inner/2+screw_offset_x_front + screw_distance_x,-box_width_inner/2+screw_offset_y,-collision_spacer])
        cylinder(r=screw_radius,h=box_border_size+collision_spacer*2);
        
        // screen
        screen_bottom_offset=box_border_size + spacer_lower + board_height+minijack_diameter+screen_inner_offset;
        
        translate([-box_length_outer/2+collision_spacer+box_border_size,-screen_width/2,screen_bottom_offset])
        rotate([0,0,90])
        cube([screen_width,box_border_size+collision_spacer*2,screen_height]);
        
        // screen screw holes
        translate([0,screen_width/2-screen_screw_diameter,-screen_screew_offset])
        screen_screw_hole();
        translate([0,-screen_width/2+screen_screw_diameter,-screen_screew_offset])
        screen_screw_hole();
        translate([0,screen_width/2-screen_screw_diameter,-screen_height_outer+screen_screw_diameter+screen_screew_offset])
        screen_screw_hole();
        translate([0,-screen_width/2+screen_screw_diameter,-screen_height_outer+screen_screw_diameter+screen_screew_offset])
        screen_screw_hole();
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

box_whole();