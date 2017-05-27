segments = 64;

module queen()
{
	difference()
	{
		scale(0.16)
		union () {
			rotate_extrude($fn = segments) {
			import("queen_profile_new.dxf");
			}
			// Add the crown
			translate([0, 0, 216])
			scale(7.0)
			import("queen_crown2.stl");
		}
		
		cylinder(2, d=5.3, $fn=100);
	}
}
