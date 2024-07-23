
//
// token.scad
//

// one side red, for "battered"
// one side black, for "has activated" / "just rallied" / "has wildly charded"

// unit is mm

inch = 25.4;
h = 5; // height unit, 5mm
o2 = 0.2;
//br = 3 / 2; // ball radius
br = 1.7;

r = inch / 2;
t = r / cos(30);
rr = r / 10;

echo(inch, r, t);

module sphe() { sphere(r=rr, $fn=12); }

module balcyl(deeper=false) {

  hf =
    is_num(deeper) ? deeper :
    deeper == true ? 2.8 :
    2;
  h = br * hf + o2;

  dz = hf > 2 ? -3 * o2 : 0;

  translate([ 0, 0, dz ])
    cylinder(r=br + 2 * o2, h=h, center=true, $fn=36);
}

module token(height=1) {

  hei = h * height;

  difference() {

    translate([ 0, 0, hei * -0.5 ])
      hull()
        for (a = [ 15 : 30 : 345 ]) {
          rotate([ 0, 0, a ]) {
            //translate([ 0, t - rr, 0 ]) cylinder(r=rr, h=h, $fn=12);
            translate([ 0, t - rr, hei - rr ]) sphe();
            translate([ 0, t - rr, rr ]) sphe();
          }
        }

    h0 = hei / 2 - h / 2;

    translate([ 0, 0, h0 ]) balcyl();

    for (a = [ 30 : 60 : 330 ]) {
      rotate([ 0, 0, a ])
        translate([ 0, r - br - 4 * o2, h0 ])
          balcyl();
    }
  }
}

token();

