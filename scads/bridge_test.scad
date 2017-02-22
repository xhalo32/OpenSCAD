delta=100;
depth=10;
width=10;
height=[5, 2];

for (i = [-1:2:1])
{
	translate([i*delta/2+i*width/2,0,0])
		cube([width,depth,height[0]], center=true);
}

translate([0,0,height[0]/2+height[1]/2])
	cube([delta+2*width,depth,height[1]], center=true);