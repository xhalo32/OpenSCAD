segments = 64;

module knight()
{
	difference()
	{
		scale(0.17)
		union ()
		{
			translate([0, 0, 30])
			rotate_extrude(convexity = 10, $fn = 64)
			import(file = "knight_profile.dxf");	

			translate([-8, -12, 58])
			scale(3.2)
			import(file = "horse3.stl");
		}
		
		cylinder(2, d=5.3, $fn=100);
	}	
}
