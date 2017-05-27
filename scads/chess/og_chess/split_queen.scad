segments = 64;

scale(0.185)
rotate([0, 0, 0])
translate([0, 0, 0]) {

    difference() {
	union() {
           rotate([90, 180, 0])
	      translate([0, 0, 140])
                 rotate_extrude(convexity = 10, $fn = segments) {
	            import_dxf(file = "queen_profile.dxf");
                 }
           rotate([90, 30, 0])
	      translate([0, 0, 167])
	         scale(7.0)
		    import(file = "queen_crown2.stl");
	}

        rotate([90, 180, 0])
	   translate([-100, 0, -80])
	      cube([200, 100, 350], center = false);

	// Alignment holes for 1.75mm filament.  Holes should be
	// diameter 2.0mm (radius 1.0mm, compensate for total scale)

	translate([0, 50, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.42, $fn = 6, center = true);

	translate([0, 0, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.42, $fn = 6, center = true);

	translate([0, -130, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.42, $fn = 6, center = true);

	translate([0, -205, 0])
	   rotate([0, 0, 0])
	      cylinder(h = 20, r = 5.42, $fn = 6, center = true);
    }
}
