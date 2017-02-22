delta=20;
width=10;
height=[5, 2];

for (j = [-1:2:1])
{
	for (i = [-1:2:1])
	{
		translate([i*delta/2+i*width/2,j*delta/2+j*width/2,0])
			cube([width,width,height[0]], center=true);
	}
}

translate([0,0,height[0]/2+height[1]/2])
	cube([delta+2*width,delta+2*width,height[1]], center=true);