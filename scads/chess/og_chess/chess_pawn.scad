segments = 64;

scale(0.2)
translate([0, 0, 1.13]) 
{

	translate([0, 0, 140])
	rotate_extrude(convexity = 10, $fn = segments)
	import("pawn_profile.dxf");

}
