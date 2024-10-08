
//
// trays/redstrike.scad

// Copyright (C) 2024 John Mettraux jmettraux@gmail.com
//
// This work is licensed under the
// Creative Commons Attribution 4.0 International License.
//
// https://creativecommons.org/licenses/by/4.0/

// unit is mm

// w250 x d210 x h220 (Prusa MK4 bed dimensions)

o2 = 0.2;

box_width = 215;   // 22cm actually
box_length = 295;  // 30cm actually // not used...
bw = box_width;
bl = box_length;
//box_height = 40;   // "remaining height"

counter_side = 18;
counter_diameter = counter_side;
counter_thickness = 1.1;
ct = counter_thickness;

wall_thickness = 1.1;
wt = wall_thickness;
wt2 = wt * 2;
wtt = 1.8;

//tray_height = counter_side;
tray_height = 17 + 0.4;
th = tray_height;

lens_diameter = 18;
lens_height = 0.8;


module tray() {

  dw = counter_side / 2 + wt / 2;
  dy = box_width / 2 - wtt / 2;

  c = sqrt(ct / 2);

  translate([ 0, 0, -tray_height / 2 - wt / 2 ])
    cube([ counter_side + wt2, box_width, wt ], center=true);

  side_height = tray_height * 0.6;
  sdz = (tray_height - side_height) / 2;

  translate([ -dw, 0, -sdz ])
    cube([ wt, box_width, side_height ], center=true);
  translate([ dw, 0, -sdz ])
    cube([ wt, box_width, side_height ], center=true);

  translate([ 0, -dy, 0 ])
    cube([ counter_side + wt2, wtt, tray_height ], center=true);
  translate([ 0, dy, 0 ])
    cube([ counter_side + wt2, wtt, tray_height ], center=true);
  translate([ 0, 0, 0 ])
    cube([ counter_side + wt2, wtt, tray_height - 5 * o2 ], center=true);

  //echo("slots", (bw - wt2) / (c * 2) + 1);

  for (i = [ 0 : (bw - wt2) / (c * 2) + 0 ]) {

    translate([ 0, bw / 2 - i * c * 2 - c, -th / 2 - wt / 2 + c * 0.74 ])
      rotate([ 45, 0, 0 ])
        cube([ counter_side + wt, ct, ct ], center=true);
  }
}


module lid() {

  lid_length = bw + 2 * wt + 1 * o2;
  lid_width = counter_side + 2 * wt2 + 1 * o2;
  lid_height = tray_height * 0.63;

  dx = lid_width / 2 - wt / 2;

  translate([ dx, 0, 0 ])
    cube([ wt, lid_length, lid_height ], center=true);
  translate([ -dx, 0, 0 ])
    cube([ wt, lid_length, lid_height ], center=true);

  translate([ 0, -lid_length / 2 + wt / 2, 0 ])
    cube([ lid_width, wt, lid_height ], center=true);
  translate([ 0, lid_length / 2 - wt / 2, 0 ])
    cube([ lid_width, wt, lid_height ], center=true);

  translate([ 0, 0, lid_height / 2 - wt / 2 ])
    cube([ lid_width, lid_length, wt ], center=true);

  //echo("count", box_length / lid_width);
}
//translate([ 0, 0, 20 ]) mirror([ 1, 0, 0 ]) lid();


tray();
translate([ 30, 0, 0 ]) lid();

