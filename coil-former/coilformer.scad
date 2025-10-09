$fn = 100;

// core parameters AMCC-0125

xyz = [9.3, 9.3]; // length, depth, height
coil_length = 9.8;
side_thickness = 0.4;
bottom_size_extra = 8;
sleeve_thickness = 1.6;


mainItem(coil_length);


module mainItem(h) {
  // bottom
  translate([0, 0, -side_thickness])
  to3D(side_thickness) {
    bottom2D();
  }

  // top
  toSleeve(thickness=sleeve_thickness, h = 2*coil_length) {
    do2D();
  }
  translate([0, 0, 2*coil_length])
  to3D(side_thickness) {
    bottom2D();
  }
}


module bottom2D() {
  difference() {
    fillet(r=9) {
      square([xyz[0]+bottom_size_extra*2, xyz[1]+bottom_size_extra*2], center=true);
    }
    do2D();
  }
}

module do2D() {
  square([xyz[0],xyz[1]], center=true);
}


/* powerful helper methods */
module to3D(h = 60) {
  linear_extrude(height = h, twist = 0) {
    children();
  }
}

module fillet(r) {
  offset(r = r) {
    offset(delta = -r) {
      children();
    }
  }
}

module toSleeve(thickness = 1.2, h = 60) {
  to3D(h) {
    difference() {
      offset(r = thickness) {
        children();
      }
      children();
    }
  }
}