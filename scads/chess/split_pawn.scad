segments = 64;

scale(0.2)
rotate([0, 0, 0])
translate([0, 0, 0]) {

    difference() {
        rotate([90, 180, 0])
	   translate([0, 0, 140])
              rotate_extrude(convexity = 10, $fn = segments) {
	         import_dxf(file = "pawn_profile.dxf");
              }

        rotate([90, 180, 0])
	   translate([-60, 0, -10])
	      cube([120, 60, 200], center = false);

	// Alignment holes for 1.75mm filament.  Holes should be
	// diameter 2.0mm (radius 1.0mm, compensate for total scale)

	translate([0, -20, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.0, $fn = 6, center = true);

	translate([0, -135, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.0, $fn = 6, center = true);
    }
}
