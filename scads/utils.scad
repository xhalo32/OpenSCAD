module roundcube(size,r)
{
	scale([1,1,1/2])
	difference()
	{
		translate([r,r,0])
		minkowski()
		{
			cube([size[0]-2*r,size[1]-2*r,size[2]]);
			cylinder(h=size[2],r=r);
		}
	}
}
module chamfercube(size,chamf)
{
	difference()
	{
		cube(size);
		translate([size[0]/2,size[1]/2])
		for (i=[0:3])
		{
			translate([	cos(90*i)*(size[0]/2)-sin(90*i)*(size[0]/2),
						sin(90*i)*(size[1]/2)+cos(90*i)*(size[1]/2),0])
				cylinder(h=size[2],r=chamf,$fn=4);
		}
	}
}
