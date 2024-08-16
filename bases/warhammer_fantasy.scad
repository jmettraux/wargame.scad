
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


// Karl:
// So i'm looking at making some small movement trays for 40k, but my models
// are all off in storage, and i haven't found any reliable measurements
// online.
//
// I'm looking for the exact dimensions of a standard 25mm round base. The
// large (bottom) diameter, the small (top) diameter, and the height of the
// base.
//
// -->
//
// Width of top of base: 24mm
// Width of bottom of base 26mm
// Height: 4mm

bw = 20;
bl = 20;
tw = bw - 2;
tl = bl - 2;
ww = (bw - tw) * 0.5;
ll = (bl - tl) * 0.5;
height = 3.3;

r2 = (bw + bl) * 0.5 / 2.8;
magnet_height = 1.0 + 0.3; // +0.2 resin / +0.3 pla
magnet_radius = 1.5 + 0.29; // +0.1 resin / +0.29 pla
mz = magnet_height / 2 - 0.1;

points = [
  [  0,  0, 0 ],
  [  0, bl, 0 ],
  [ bw, bl, 0 ],
  [ bw,  0, 0 ],
  [      ww,      ll, height ],
  [      ww, bl - ll, height ],
  [ bw - ww, bl - ll, height ],
  [ bw - ww,      ll, height ], ];
faces = [
  [ 0, 1, 2, 3 ],  // bottom
  [ 4, 5, 1, 0 ],  // front
  [ 7, 6, 5, 4 ],  // top
  [ 5, 6, 2, 1 ],  // right
  [ 6, 7, 3, 2 ],  // back
  [ 7, 4, 0, 3 ] ]; // left

translate([ 0, 0, 0 ]) difference() {

  translate([ -bw * 0.5, -bl * 0.5, 0]) polyhedron(points, faces);

  //#union() {
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
  //}
}

