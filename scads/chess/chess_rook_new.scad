segments = 64;

module rook()
{
	difference()
	{
		scale(0.18)
		translate([0, 0, 160.88])
		difference()
		{
			rotate_extrude(convexity = 10, $fn = segments)
			import(file = "rook_profile.dxf");

			translate([0, 0, 20])
			for (i = [0:3])
			{
				rotate([0, 0, 90*i])
				linear_extrude(height = 20)
				polygon([[0,0],[60,30],[30,60]]);
			}

		}
		
		cylinder(2, d=5.3, $fn=100);
	}
}
