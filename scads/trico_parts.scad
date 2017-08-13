$fn=100;
use <utils.scad>;
_d=12; d=9.45-0.25; dd=9.6+0.4;

/*
rod();
translate([-13/2+9.82/2,9.82+1,0])
	servo();*/
/*
rod();
translate([9.82/2,9.82+1,0])
	axelmount();
*/
nazemount();


module rod()
{
	side=9.85-0.03;
	chamfer=0.7+0.1;
	l=d*2+dd; //l=20;
	width=1;

	difference()
	{
		translate([-width,-width,0])
			chamfercube([side+2*width,side+2*width,l],chamfer+width/sqrt(2));
		chamfercube([side,side,l],chamfer);
	}
}

module servo()
{
	size=[13,26.35,16.3];
	chamfer=0.3; width=1;
	difference()
	{
		translate([-width,-width,0])
			chamfercube([size[0]+2*width,size[1]+2*width-3,size[2]],chamfer+width/sqrt(2));
		chamfercube(size,chamfer);
	}
}

module axelmount()
{
	hole=3.95; holeheight=5.6;
	chamfer=0.8*2;

	translate([0,holeheight+hole/2,0])
	difference()
	{
		for (i=[0:1])
		{
			translate([0,0,i*(d+dd)])
			{
				cylinder(h=d,d=_d);
				translate([-_d/2,-holeheight-hole/2,0])
					chamfercube([_d,holeheight+hole/2+chamfer/sqrt(2),d],chamfer);
			}
		}
		cylinder(h=2*d+dd+1,d=hole);
	}
}

module nazemount()
{
	size=[20,30+0.5,1.65]; hang=2;
	yplus=2; height=6; hstart=-2; dy=5; dz=2.6;

	difference()
	{
		union()
		{
			translate([0,-yplus,hstart])
				cube([size[0],size[1]+2*yplus,height]);
			for (i=[0:1])
			{
				translate([0,-yplus+i*(size[1]+2*yplus),(2*hstart+height)/2])
					rotate(90,[0,1,0])
						cylinder(h=size[0],d=height);
			}
		}
		cube(size);
		translate([0,hang,-10])
			cube([size[0],size[1]-2*hang,10]);
		translate([0,dy,0])
			cube([size[0],size[1]-2*dy,dz]);
		for (i=[0:1])
		{
			translate([0,-yplus+i*(size[1]+2*yplus),(2*hstart+height)/2])
				rotate(90,[0,1,0])
					cylinder(h=size[0],d=3);
		}
	}
}
