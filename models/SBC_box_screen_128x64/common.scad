// common

board_height = 1.5;

usb_height = 16;

screen_width=22;
screen_width_outer=24;
screen_height = 12;
screen_inner_offset=5;
screen_screw_diameter=3;
screen_screew_offset=1;
screen_height_outer=27;

minijack_diameter = 7;
minijack_offset = 54;

spacer_lower = 4;

box_length_inner = 86;
box_width_inner = 57;
box_height_inner = spacer_lower + board_height + minijack_diameter+screen_height_outer;

box_border_size = 2;

box_length_outer= box_length_inner + box_border_size*2;
box_width_outer = box_width_inner+ box_border_size*2;
box_height_outer = box_height_inner+ box_border_size*2;

sdcard_slot_height = 2.5 + spacer_lower + box_border_size;
sdcard_slot_radius= 8;
        
power_height= 7;
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

screw_offset_y = 4;
screw_offset_x_front = 4.5;
screw_distance_x= 58;
screw_radius=1.5;

upper_vent_width=40;
upper_vent_diameter=38;
upper_vent_inner_diameter=24;
upper_vent_hole_radius=1.5;
upper_vent_hole_offset=3;
upper_vent_bridge_width=3;
upper_vent_offset=16;

collision_spacer = 0.1;
box_lower_height = box_border_size+ board_height+spacer_lower + minijack_diameter;

actual_button_width = 6;
button_width = actual_button_width+2;
button_height_offset = 2;
button_height_full = 5;
button_holder_height = 2;
button_diameter = 3;
button_body_height = button_height_full - button_height_offset;
button_attach_width = 2;
button_attach_height = button_height_full+button_attach_width;