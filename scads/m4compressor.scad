$fn=60;
$vpr=[45,0,45];
$vpt=[0,2.5,36.4];
$vpd=300;

diameter=[19.9,16];
height=[68,66];

track=[1.3,1.8,10];

stopper_big=[8,10.5,5];
stopper_big_height=3.7;

stopper_small=[3,6,6];


knob=
[
	[0,0],
	[3,0],
	[3,1],
	[4,1],
	[4,2],
	[3.5,4.8],
	[0,4.8],
];


color([1,1,1,0.5])
compressor();

union()
{
	
}

module compressor()
{
	difference()
	{
		union()
		{
			cylinder(height[0], d=diameter[0]);

			translate([0,0,height[0]])
				knob();

			for (i = [-1:0])
			{
				translate([i*(diameter[0]/2+track[0]),-track[1]/2,0])
					cube([diameter[0]/2+track[0], track[1], track[2]]);
			}

			translate([-stopper_big[1]/2,0,stopper_big_height])
				cube([stopper_big[1], diameter[0]/2+stopper_big[0], stopper_big[2]]);

			translate([-stopper_small[1]/2,-diameter[0]/2-stopper_small[0],0])
				cube([stopper_small[1], diameter[0]/2+stopper_small[0], stopper_small[2]]);
		}

		cylinder(height[1], d=diameter[1]);
	}
}

module knob()
{
	rotate_extrude()
		polygon(knob);
}