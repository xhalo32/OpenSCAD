segments = 64;

scale(0.185)
rotate([0, 0, 0])
translate([0, 0, 0]) {

translate([0, 0, 0])
union () {
    rotate_extrude(convexity = 10, $fn = segments) {
	import_dxf(file = "queen_profile_new.dxf");
    }
    // Add the crown
    translate([0, 0, 216])
    scale(7.0)
    import(file = "queen_crown2.stl");
}

}
