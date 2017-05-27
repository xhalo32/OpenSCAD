segments = 64;

module king()
{
	difference()
	{
		scale(0.16)
		union()
		{
			rotate_extrude($fn = segments)
			{
				translate([-0.268,0,0])
				import("king_profile_new.dxf");
			}
			translate([0, 10, 297])
			rotate([90, 0, 0])
			linear_extrude(height = 20)
			{
				scale(1.2)
				translate([-25,2])
				import("cross_profile.dxf");
			}
		}
		
		cylinder(2, d=5.3, $fn=100);
	}
	
}
