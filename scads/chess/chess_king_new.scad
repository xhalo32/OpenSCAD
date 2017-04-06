segments = 64;

scale(0.185)
rotate([0, 0, 0])
translate([0, 0, 0]) {

translate([0, 0, 0])
union () {
    rotate_extrude(convexity = 10, $fn = segments) {
	import_dxf(file = "king_profile_new.dxf");
    }
    translate([-25, 10, 297])
    rotate([90, 0, 0])
    linear_extrude(height = 20) {
	import_dxf(file = "cross_profile.dxf");
    }
}

}
