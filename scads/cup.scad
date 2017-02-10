module cup(height, height2, radius, radius2)
{
	difference()
	{
		cylinder(height, radius, radius);
		translate([0,0,height-height2])
		cylinder(height2, radius2, radius2);
	}



}


cup(10,3,6,5);
translate([10,-10,0])cup(4,3,4,3, $fn=6);