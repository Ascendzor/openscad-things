use <threadlib/threadlib.scad>


// iphone 12 mini dimensions
phoneWidth = 64.2;
phoneHeight = 131.5;
phoneDepth = 7.4;

width = 12;
ballInterfaceRadius = 8;

nutRadius = 33/2 + 1;

module phoneHolder() {
  baseHeight = 3;
  sideThickness = 4;
  
  clipHeight = 4;

  difference() {
    cube([phoneWidth+8, width, phoneDepth+baseHeight]);

    translate([sideThickness, -1, baseHeight])
    cube([phoneWidth, width+2, phoneDepth+1]);
  }

  module overhang() {
    difference() {
      cube([sideThickness+2, width, 3]);
      
      translate([4, 0, 0])
      rotate([0, 45, 0])
      translate([0, -1, -1])
      cube([4, width+2, 5]);

      translate([3, -1, 4])
      rotate([0, 45, 0])
      cube([4, width+2, 5]);
    }
  }

  translate([0, 0, baseHeight+phoneDepth])
  overhang();

  translate([sideThickness+phoneWidth+sideThickness, width, baseHeight+phoneDepth])
  rotate([0, 0, 180])
  overhang();

  ballInterface();
}

module ballInterface() {
  sphere(ballInterfaceRadius, $fn=128);
}

module hand() {
  translate([0, 0, 15]) {
    difference() {
      sphere(ballInterfaceRadius+1, $fn=128);

      translate([-10, -10, 3])
      cube(40);

      sphere(ballInterfaceRadius+0.5, $fn=128);
    }
  }

  cylinder(8, 4, 4, $fn=128);
}

module nutHolder() {
  bolt("M20", turns=8);
}


footRadius = 13;
module stand() {
  difference() {
    cylinder(48+8, nutRadius+4, nutRadius+4, $fn=6);

    translate([0, 0, 4])
    cylinder(60, nutRadius, nutRadius, $fn=6);
  }
}


stand();

translate([0, 0, 48]) {

    rotate([-90, 0, 0])
    translate([0, 0, nutRadius+8]) {
      translate([0, 0, -10])
      cylinder(10, 4, 4, $fn=128);
      nutHolder();
    }


    rotate([90, 0, 0]) translate([0, 0, 34]) {
      
      ballInterface();

      translate([0, 0, -16])
      cylinder(10, 4, 4, $fn=128);
    }
    
}

// cube([1, 2, 3]);

// nutHolder();