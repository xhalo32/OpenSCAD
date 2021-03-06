segments = 64;

scale(0.185)
rotate([0, 0, 0])
translate([0, 0, 0]) {

    difference() {
	union() {
           rotate([90, 180, 0])
	      translate([0, 0, 140])
                 rotate_extrude(convexity = 10, $fn = segments) {
	            import_dxf(file = "king_profile.dxf");
                 }
           rotate([180, 180, 0])
	      translate([-25, 182, -5])
                 linear_extrude(height = 10) {
	            import_dxf(file = "cross_profile.dxf");
	         }
	}

        rotate([90, 180, 0])
	   translate([-100, 0, -150])
	      cube([200, 100, 370], center = false);

	// Alignment holes for 1.75mm filament.  Holes should be
	// diameter 2.0mm (radius 1.0mm, compensate for total scale)

	translate([0, -70, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.42, $fn = 6, center = true);

	translate([0, -135, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.42, $fn = 6, center = true);

	translate([0, 90, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.42, $fn = 6, center = true);

    }
}
