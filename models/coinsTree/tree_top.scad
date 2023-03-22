include <./common.scad>


tree_top_height = 10;
tree_top_diameter = 30;

tree_top_border = 3;

module tree_top(){
    difference(){
        resize([0, 0, tree_top_height*2])
        sphere(d = tree_top_diameter);
         
        translate([0,0,-tree_top_diameter/2])
        cube(tree_top_diameter, center= true);
        
        #
        translate([0,0,-0.1])
        cylinder(h=tree_top_height - tree_top_border , d=  nut_diameter_outer);
    }
}


tree_top();