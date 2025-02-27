
//
// bases/warhammer_fantasy_no_bevel.scad

// Copyright (C) 2025 John Mettraux jmettraux@gmail.com
//
// This work is licensed under the
// Creative Commons Attribution 4.0 International License.
//
// https://creativecommons.org/licenses/by/4.0/

$fn = 60;
//$fn = 120;
//$fn = 240;
  // circle facet count, set to 120 or 360 for "round"

// unit is millimeter (except for the size variable)

length = 40;
width = 20;
height = 1.4 + 0.35;
gap = 1.0;
g2 = 2 * gap;

magnet_height = 1.0 + 0.3; // +0.2 resin / +0.3 pla
magnet_radius = 1.5 + 0.29; // +0.1 resin / +0.29 pla

difference() {

  cube([ length, width, height ], center = true);

  translate([ 0, 0, -0.4 ])
    cube([ length - g2, width - g2, height ], center = true);
}

module magnet_holder() {
  difference() {
    cylinder(h = height, r = magnet_radius + 0.4, center = true);
    #translate([ 0, 0, -height / 2 ])
      cylinder(h = magnet_height, r = magnet_radius, center = true);
  }
}

translate([ 0, 0, 0 ]) magnet_holder();

