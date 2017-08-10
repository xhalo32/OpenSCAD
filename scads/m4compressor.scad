$fn=100;

diameter=[19.9,15.5];
height=[68,66];

track=[1.3,1.8,10];

stopper_big=[8,10.5,5]; //print1

stopper_big=[8,10.5,10-4.1+0.7]; //print2
stopper_big=[8,10.5,10-4.1]; //print3

stopper_big_height=3.7; //print1

stopper_big_height=3; //print2
stopper_big_height=4; //print3


guider_height=0; //print2

guider=[2.6,6,6];
guider_expand=3.05;
guider_expand_height=2;


knob=
[
	[0,0],
	[3,0],
	[3,1],
	[4.2,1.4],
	[4.2,2],
	[3.5,4.7],
	[0,4.7],
];


compressor();



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

			translate([0,0,guider_height])
			hull()
			{
				translate([-guider[1]/2,-diameter[0]/2-guider[0],guider[2]-guider_expand_height])
					cube([guider[1], diameter[0]/2+guider[0], guider_expand_height]);
			
				translate([-guider[1]/2,-diameter[0]/2-guider[0]+guider_expand,0])
					cube([guider[1], diameter[0]/2+guider[0]-guider_expand, guider[2]]);
				
			}
		}

		cylinder(height[1], d=diameter[1]);
	}
}

module knob()
{
	rotate_extrude()
		polygon(knob);
}
