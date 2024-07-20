
//
// rampant.scad

$fn = 12;

// unit is mm

itmm = 25.4; // inch to mm

l = 12; // 12 inches
width = 6;
height = 5;
color_layer_height = 1;
text_height = color_layer_height;

font_size = 4.9;
mark_margin_right = 2;

cube([ width, l * itmm, height ], false);

difference() {

  for (i = [ 0 : 2 : l - 1 ]) {

    color("blue")
      translate([ 0, i * itmm, height ])
        cube([ width, itmm, color_layer_height ], false);
  };

  // 3 mark

  translate([ width * 0.9, 3 * itmm - mark_margin_right, height ])
    rotate([ 0, 0, 90 ])
    linear_extrude(text_height * 1.1)
      text("3", size=font_size, halign="right");

};


// 6, 8, 10, and 12 marks

