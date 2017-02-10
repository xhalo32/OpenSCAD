$fn = 6;

difference()
{
	cube([10,10,10,], center=true);
	
	union()
	{
		translate([0,0,4]) cylinder(r=3, h=1, $fn=6);
		cylinder(r=1.3, h=10, center=true, $fn=20);
	}
}