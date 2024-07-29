
//
// rampant.scad

// Copyright (C) 2024 John Mettraux jmettraux@gmail.com
//
// This work is licensed under the
// Creative Commons Attribution 4.0 International License.
//
// https://creativecommons.org/licenses/by/4.0/


  // 3, 6, 8, 10, or 12 inches stick?
  //
length = 12;


// unit is mm

$fn = 12;
itmm = 25.4; // inch to mm
l = 12; // 12 inches
width = 6.6;
height = 5.6;
color_layer_height = 1;
text_height = color_layer_height;

mark_font_size = 4.9;
mark_margin_right = 1.0;

text_font_size = 4.0;
text_margin_right = 0.5;
text_margin_bottom = 1.4;


translate([ 0, - length * itmm / 2, 0 ]) difference() {

  union() {

    difference() {

      cube([ width, l * itmm, height ], false);

      //translate([ width - text_height, 0, 0.42 ])
      //  rotate([ 90, 0, 90 ])
      //    linear_extrude(text_height * 1.1)
      //      text(
      //        "<>3 ||| i6 li8 m10 lm12 !12 /// jav6 slmbx12 bx18",
      //        size=font_size, halign="left");

      // right side

      translate([
        width - text_height, 3 * itmm + text_margin_right, text_margin_bottom
      ])
        rotate([ 90, 0, 90 ])
          linear_extrude(text_height * 1.1)
            //text("↔ |", size=text_font_size, halign="right");
            if (length == 3)
              text("< >  ", size=text_font_size, halign="right");
            else
              text("< > |", size=text_font_size, halign="right");
      translate([
        width - text_height, 6 * itmm + text_margin_right, text_margin_bottom
      ])
        rotate([ 90, 0, 90 ])
          linear_extrude(text_height * 1.1)
            //text("inf → jav |", size=text_font_size, halign="right");
            if (length == 6)
              text("inf > jav  ", size=text_font_size, halign="right");
            else
              text("inf > jav |", size=text_font_size, halign="right");
      translate([
        width - text_height, 8 * itmm + text_margin_right, text_margin_bottom
      ])
        rotate([ 90, 0, 90 ])
          linear_extrude(text_height * 1.1)
            //text("linf → |", size=text_font_size, halign="right");
            if (length == 8)
              text("linf >  ", size=text_font_size, halign="right");
            else
              text("linf > |", size=text_font_size, halign="right");
      translate([
        width - text_height, 10 * itmm + text_margin_right, text_margin_bottom
      ])
        rotate([ 90, 0, 90 ])
          linear_extrude(text_height * 1.1)
            //text("cav → |", size=text_font_size, halign="right");
            if (length == 10)
              text("cav >  ", size=text_font_size, halign="right");
            else
              text("cav > |", size=text_font_size, halign="right");
      translate([
        width - text_height, 12 * itmm + text_margin_right, text_margin_bottom
      ])
        rotate([ 90, 0, 90 ])
          linear_extrude(text_height * 1.1)
            //text("lcav → msbx |", size=text_font_size, halign="right");
            //text("lcav → slmbx ", size=text_font_size, halign="right");
            //text("lcav > slmbx ", size=text_font_size, halign="right");
            text("lcav > sl mbx ", size=text_font_size, halign="right");

      // left (other) side

      translate([
        //width - text_height, 6 * itmm + text_margin_right, text_margin_bottom
        text_height * 0.9, 6 * itmm + text_margin_right, text_margin_bottom
      ])
        rotate([ 90, 0, -90 ])
          linear_extrude(text_height * 1.1)
            //text("inf → jav |", size=text_font_size, halign="right");
            if (length == 6)
              text("  18 bx <", size=text_font_size, halign="left");
            else
              text("| 18 bx <", size=text_font_size, halign="left");

      if (length == 12) {
        translate([
          text_height * 0.9, 12 * itmm + text_margin_right, text_margin_bottom
        ])
          rotate([ 90, 0, -90 ])
            linear_extrude(text_height * 1.1)
              text("  ldship <", size=text_font_size, halign="left");
      }
    }

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
          text("3", size=mark_font_size, halign="right");

    };

    // 6, 8, 10, and 12 marks

    for (i = [ 6, 8, 10, 12 ]) {

      color("blue")
        translate([ width * 0.9, i * itmm - mark_margin_right, height ])
          rotate([ 0, 0, 90 ])
          linear_extrude(text_height * 1.1)
            text(str(i), size=mark_font_size, halign="right");
    };
  };

  if (length < 12) {

    translate([ - width / 2, length * itmm - 0.05, - height / 2 ])
      cube([ width * 2, l * itmm, height * 2 ], false);
  }
};

