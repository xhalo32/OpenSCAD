segments = 64;

module pawn()
{
	difference()
	{
		scale(0.2)
		translate([0, 0, 1.13]) 
		{

			rotate_extrude(convexity = 10, $fn = segments)
			translate([-0.26855, 0, 0])
			import("pawn_profile_new.dxf");

		}
		
		cylinder(2, d=5.3, $fn=100);
	}
}
