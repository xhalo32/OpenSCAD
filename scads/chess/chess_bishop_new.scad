segments = 64;

module bishop()
{
	difference()
	{
		scale(0.18)
		difference () 
		{
			rotate_extrude($fn = segments)
			import(file = "bishop_profile_new.dxf");
			translate([-30, 0, 222-5])
			rotate([0, -45, 0])
			cube([10, 80, 80], center = true);
		}

		cylinder(2, d=5.3, $fn=100);
	}
}
