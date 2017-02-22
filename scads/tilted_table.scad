delta=20;
width=10;
tilt_angle=10;

height=[5+(2*width+delta)*sqrt(2)*sin(tilt_angle)/2, 2];

difference()
{
		
	rotate(tilt_angle,[1,1,0])
	{
		

	union()
	{
		for (j = [-1:2:1])
		{
			for (i = [-1:2:1])
			{
				translate([i*delta/2+i*width/2-width/2,j*delta/2+j*width/2-width/2,-100])
					cube([width,width,height[0]+100]);
			}
		}
	}

	translate([0,0,height[0]+height[1]/2])
		cube([delta+2*width,delta+2*width,height[1]], center=true);

	}

	translate([-500,-500,-1000])
		cube(1000);
}