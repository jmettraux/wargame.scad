
//
// bases/legion.scad

// Copyright (C) 2024 John Mettraux jmettraux@gmail.com
//
// This work is licensed under the
// Creative Commons Attribution 4.0 International License.
//
// https://creativecommons.org/licenses/by/4.0/

//$fn=180;
$fn=360;

// unit is millimeter (except for the size variable)

bottom_diameter = 27;
top_diameter = 25.6;
height = 4;

magnet_height = 1.0 + 0.3; // +0.2 resin / +0.3 pla
magnet_radius = 1.5 + 0.29; // +0.1 resin / +0.29 pla
mx = 0.5 * bottom_diameter - 2 * magnet_radius;
mz = 0.5 * magnet_height - 0.1;


difference() {

  cylinder(height, d1=bottom_diameter, d2=top_diameter);

  #for(i = [ 0, 120, 240 ]) {
    rotate([ 0, 0, i ])
      translate([ mx, 0, mz ])
        cylinder(magnet_height, r=magnet_radius, center=true);
  }
}

