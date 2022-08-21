$fs=0.1;

coin_small_diameter=30;
coin_big_diameter=36;
coint_height=3;

module holder(coint_diameter, coins_count,
    holder_border_width=2,
    inner_border_width = 1,
    elevation = 1,
    edge_softeness = 1,
    back_base_diameter = 10){
    
    module coin(){#
        cylinder(h = coint_height, d= coint_diameter);
    }
        
    holder_depth = coins_count * (inner_border_width + coint_height) + holder_border_width-inner_border_width -edge_softeness*2;
    holder_width = coint_diameter + holder_border_width*2 -edge_softeness*2 ;
    holder_side_height = coint_diameter* 0.4 + holder_border_width- edge_softeness;
    holder_height = coins_count * elevation + holder_side_height ;
    
    center_x = coint_diameter/2 + holder_border_width;
    
    // base
    difference(){
        hull(){
            minkowski(){
                // edge softener
                translate([edge_softeness,edge_softeness,edge_softeness])
                sphere(r= edge_softeness);
                
                // main ledge
                hull() {
                    cube([holder_width,holder_border_width, holder_side_height]);
                    
                    translate([0,holder_depth, holder_height - holder_side_height])         
                    cube([holder_width, holder_border_width, holder_side_height]);
                }
            }
            
            // base bottom
            translate([center_x,holder_depth - holder_border_width,0])
            cylinder(h=1, d = back_base_diameter);
        }
        
        // center spacer
        translate([center_x,-1,holder_border_width + coint_diameter/2])        
        hull(){
            rotate([-90,0,0])
            cylinder(h = coint_height, d= coint_diameter-holder_border_width*2 - edge_softeness);
            
            translate([0,holder_depth+2 + edge_softeness , holder_height - holder_side_height + holder_border_width ])      
            rotate([-90,0,0])
            cylinder(h = coint_height, d= coint_diameter-holder_border_width*2 -edge_softeness);
        }
        
        // coin places
        for (n = [1:coins_count]){
            pos_x = center_x;
            let (
                pos_y =holder_border_width +  (n-1) *( inner_border_width + coint_height) , 
                pos_z =coint_diameter/2+ n*elevation){
                
                translate([pos_x, pos_y, pos_z])
                rotate([-90,0,0])
                coin();
            }
        }
    }
}

holder(coin_small_diameter, 12);