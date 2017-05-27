segments = 64;

scale(0.2)
rotate([0, 0, 0])
translate([0, 0, 0]) {

    difference() {
	union() {
           rotate([90, 180, 0])
	      translate([0, 0, -80])
                 rotate_extrude(convexity = 10, $fn = segments) {
	            import_dxf(file = "knight_profile.dxf");
                 }
           rotate([90, 180, 0])
	      translate([-8, -12, -52.1])
		 scale(3.2)
		    import(file = "horse3.stl");
	}

        rotate([90, 180, 0])
	   translate([-100, 0, -150])
	      cube([200, 100, 300], center = false);

	// Alignment holes for 1.75mm filament.  Holes should be
	// diameter 2.0mm (radius 1.0mm, compensate for total scale)

	translate([20, -70, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.0, $fn = 6, center = true);

	translate([7, 20, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.0, $fn = 6, center = true);

	translate([0, 75, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.0, $fn = 6, center = true);
    }
}
