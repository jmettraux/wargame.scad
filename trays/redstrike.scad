
//
// trays/redstrike.scad

// unit is mm

// w250 x d210 x h220 (Prusa MK4 bed dimensions)

box_width = 215;   // 22cm actually
box_length = 295;  // 30cm actually
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

//tray_height = counter_side;
tray_height = 17 + 0.4;
th = tray_height;


module column() {

  dw = counter_side / 2 + wt / 2;
  dy = box_width / 2 - wt / 2;

  c = sqrt(ct / 2);

  translate([ 0, 0, -tray_height / 2 - wt / 2 ])
    cube([ counter_side + wt2, box_width, wt ], center=true);

  translate([ -dw, 0, 0 ])
    cube([ wt, box_width, tray_height ], center=true);
  translate([ dw, 0, 0 ])
    cube([ wt, box_width, tray_height ], center=true);

  translate([ 0, -dy, 0 ])
    cube([ counter_side + wt2, wt, tray_height ], center=true);
  translate([ 0, dy, 0 ])
    cube([ counter_side + wt2, wt, tray_height ], center=true);

  //echo("slots", (bw - wt2) / (c * 2) + 1);

  for (i = [ 0 : (bw - wt2) / (c * 2) + 0 ]) {

    translate([ 0, bw / 2 - i * c * 2 - c, -th / 2 - wt / 2 + c * 0.74 ])
      rotate([ 45, 0, 0 ])
        cube([ counter_side + wt2, ct, ct ], center=true);
  }
}

column();

