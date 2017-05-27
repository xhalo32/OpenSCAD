segments = 64;

scale(0.2)
rotate([0, 180, 0])
translate([0, 0, 0]) {

    difference() {
        rotate([90, 180, 0])
	   translate([0, 0, 140])
              rotate_extrude(convexity = 10, $fn = segments) {
	         import_dxf(file = "bishop_profile.dxf");
              }

	translate([30, -140, 0])
	   rotate([0, 0, 45])
	      cube([10, 80, 80], center = true);

        rotate([90, 0, 0])
	   translate([-100, 0, -100])
	      cube([200, 100, 300], center = false);

	// Alignment holes for 1.75mm filament.  Holes should be
	// diameter 2.0mm (radius 1.0mm, compensate for total scale)

	translate([0, 35, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.0, $fn = 6, center = true);

	translate([0, -95, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.0, $fn = 6, center = true);
    }
}
