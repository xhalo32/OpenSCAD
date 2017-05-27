$fn=60;

XT60_holder_mount();

module XT60()
{
	//original measurements
	width=14; height=8; depth=6.5; chamfer=3.5; cut=[2,1];
	//printabĺe
	width=14.2; height=8; depth=6.8; chamfer=3.3; cut=[1.8,1];

	difference()
	{
		cube([width,depth,height]);
		translate([width+depth/2-chamfer/sqrt(2),0])
		for (i = [-1:2:1])
		{
			translate([0,i*depth/2,0])
				rotate(45,[0,0,1])
					cube([depth/sqrt(2),depth/sqrt(2),height]);
		}

		translate([5.9+1-cut[0]/2,depth-cut[1]])
			cube([cut[0],cut[1],height]);
	}
}

module XT60_holder()
{
	width=16; height=8; depth=8.7; chamfer=4;
	difference()
	{
		cube([width,depth,height]);
		translate([1,1,0])
		XT60();

		translate([width+depth/2-chamfer/sqrt(2),0])
		translate([0,depth/2,0])
			rotate(45,[0,0,1])
				cube([depth/sqrt(2),depth/sqrt(2),height]);
	}
}

module XT60_holder_mount()
{
	translate([0,1.5])
		XT60_holder();

	translate([-2+1,0,+1])
	minkowski()
	{
		cube([20-2,1.5,12-2]);

		rotate(90,[1,0,0])
			cylinder(pow(10,-100),r=1);
	}

	size=3;
	translate([3.5+size,1.5+8.5,4])
		rotate(180,[0,0,1])
			rotate(90,[1,0,0])
				linear_extrude(0)
					text("XT60", size, halign="center", valign="center");
}