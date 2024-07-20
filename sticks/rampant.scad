
//
// rampant.scad

$fn = 12;

// unit is mm

itmm = 25.4; // inch to mm

l = 12; // 12 inches
width = 6;
height = 5;
color_layer_height = 1;

cube([ width, l * itmm, height ], false);


for (i = [ 0 : 2 : l - 1 ]) {
  color("blue")
    translate([ 0, i * itmm, height ])
      cube([ width, itmm, color_layer_height ], false);
};

