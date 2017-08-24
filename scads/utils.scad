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
module roundcube1(size,r)
{
	difference()
	{
		cube(size);
		translate([-1,-1,size[2]-r])
			cube([size[0]+2,r+1,r+2]);
	}
	translate([0,r,size[2]-r])
		intersection()
		{
			rotate(90,[0,1,0])
				cylinder(h=size[0],r=r);
			translate([0,-r,0])
				cube([size[0],r,r]);
		}
}
