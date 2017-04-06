$fn=100;
size=[33, 20];
d=3;
delta=5;
deltah=5;



*translate([-11,0,0])
color([1,0,0,0.5])
cube([22,1,1]);

*translate([-5,0,33])
color([1,0,0,0.5])
cube([10,1,1]);


difference()
{
	*union()
	{
		translate([-delta, -delta])
		cube([size[1]+2*delta, size[1]+2*delta, deltah]);
		cube([size[1], size[1], size[0]]);
		
	}
	rotate_extrude()
	{
		scale(0.0467)
		import("thing_profile.dxf");
	}
			
	#cylinder(size[0], d=d);
	translate([0,0,33-2.4-2])
	hull()
	{
		cylinder(2.4, d=6.2, $fn=6);
		translate([10,0,0])
		cylinder(2.4, d=6.2, $fn=6);
	}

	translate([0,0,2])
	hull()
	{
		cylinder(2.4, d=6.1, $fn=6);
		translate([10,0,0])
		cylinder(2.4, d=6.1, $fn=6);
	}
}