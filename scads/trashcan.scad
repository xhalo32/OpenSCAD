/*
rotate_extrude()
{
	translate([100,0,0])
	square([10, 20]);
}

linear_extrude(height=100, twist=720)
	translate([20,0])
		circle(10);
*/


rotate_extrude()
{
	square([50,10]);
	translate([45,100])
		circle(5);
}

for(r=[0:360/10:360-360/10])
{
	rotate(r, [0,0,1])
	linear_extrude(height=100, twist=36)
	{
	translate([45,0]) circle(r=3);
	}
}