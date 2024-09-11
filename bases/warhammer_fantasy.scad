
//
// bases/warhammer_fantasy.scad

// Copyright (C) 2024 John Mettraux jmettraux@gmail.com
//
// This work is licensed under the
// Creative Commons Attribution 4.0 International License.
//
// https://creativecommons.org/licenses/by/4.0/

$fn=60;
//$fn=120;
//$fn=240;
  // circle facet count, set to 120 or 360 for "round"

// unit is millimeter (except for the size variable)


// 20mm x 20mm
// 25mm x 25mm
// 25mm x 50mm
// 40mm x 40mm

//width = 20;
//length = 20;
width = 25;
length = 50;

ww = 1; // vertical delta betwen base width and top width
ll = 1; // vertical delta betwen base length and top length
tw = width - 2 * ww;
tl = length - 2 * ll;
height = 3.3;

magnet_height = 1.0 + 0.3; // +0.2 resin / +0.3 pla
magnet_radius = 1.5 + 0.29; // +0.1 resin / +0.29 pla
mz = magnet_height / 2 - 0.1;
dd = 2.1;
wid = width * 0.5 - magnet_radius * dd;
lend = length * 0.5 - magnet_radius * dd;

points = [
  [     0,      0, 0 ],
  [     0, length, 0 ],
  [ width, length, 0 ],
  [ width,      0, 0 ],
  [         ww,          ll, height ],
  [         ww, length - ll, height ],
  [ width - ww, length - ll, height ],
  [ width - ww,          ll, height ], ];
faces = [
  [ 0, 1, 2, 3 ],    // bottom
  [ 4, 5, 1, 0 ],    // front
  [ 7, 6, 5, 4 ],    // top
  [ 5, 6, 2, 1 ],    // right
  [ 6, 7, 3, 2 ],    // back
  [ 7, 4, 0, 3 ] ];  // left

difference() {

  translate([ -width * 0.5, -length * 0.5, 0]) polyhedron(points, faces);

  #union() {

    mr = magnet_radius;

    translate([ 0, 0, mz ]) cylinder(magnet_height, r=mr, center=true);
      // central magnet hole

    translate([ wid, 0, mz ]) cylinder(magnet_height, r=mr, center=true);
    translate([ -wid, 0, mz ]) cylinder(magnet_height, r=mr, center=true);
    translate([ 0, lend, mz ]) cylinder(magnet_height, r=mr, center=true);
    translate([ 0, -lend, mz ]) cylinder(magnet_height, r=mr, center=true);

    if (width > 25 || length > 25) {
      translate([ wid, lend, mz ]) cylinder(magnet_height, r=mr, center=true);
      translate([ wid, -lend, mz ]) cylinder(magnet_height, r=mr, center=true);
      translate([ -wid, lend, mz ]) cylinder(magnet_height, r=mr, center=true);
      translate([ -wid, -lend, mz ]) cylinder(magnet_height, r=mr, center=true);
    }
  }
}

