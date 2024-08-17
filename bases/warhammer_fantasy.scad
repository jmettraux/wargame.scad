
//
// warhammer_fantasy.scad

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

width = 20;
length = 20;

ww = 1; // vertical delta betwen base width and top width
ll = 1; // vertical delta betwen base length and top length
tw = width - 2 * ww;
tl = length - 2 * ll;
height = 3.3;

r2 = (width + length) * 0.5 / 2.8;
magnet_height = 1.0 + 0.3; // +0.2 resin / +0.3 pla
magnet_radius = 1.5 + 0.29; // +0.1 resin / +0.29 pla
mz = magnet_height / 2 - 0.1;

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
  translate([ 0, 0, mz ])
    cylinder(magnet_height, r=magnet_radius, center=true);

  rotate([ 0, 0, 0 ]) translate([ r2, 0, mz ])
    cylinder(magnet_height, r=magnet_radius, center=true);
  rotate([ 0, 0, 90 ]) translate([ r2, 0, mz ])
    cylinder(magnet_height, r=magnet_radius, center=true);
  rotate([ 0, 0, 180 ]) translate([ r2, 0, mz ])
    cylinder(magnet_height, r=magnet_radius, center=true);
  rotate([ 0, 0, 270 ]) translate([ r2, 0, mz ])
    cylinder(magnet_height, r=magnet_radius, center=true);
  }
}

