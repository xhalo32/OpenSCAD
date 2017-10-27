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
//nazemount();
//leg();
//wireclamp();
hat();


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
	size=[20,30+0.5,1.65+0.0]; hang=2;
	yplus=2; height=8; hstart=-2; dy=5; dz=2.6;

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
		translate([0,dy,size[2]])
			cube([size[0],size[1]-2*dy,dz]);
		for (i=[0:1])
		{
			translate([0,-yplus+i*(size[1]+2*yplus),(2*hstart+height)/2])
				rotate(90,[0,1,0])
					cylinder(h=size[0],d=3);
		}
	}
}

module leg()
{
	side=9.85-0.03;
	chamfer=0.7+0.1;
	width=1;
	_leg=[100,2.5,25];
	hole=[5,5,3];

	difference()
	{
		translate([-width,-_leg[1],0])
			chamfercube([side+2*width,side/1.5+2*width,_leg[2]],chamfer+width/sqrt(2));
#chamfercube([side,side/1.5+2*width,_leg[2]],chamfer);
	}
	difference()
	{
		translate([-10,-_leg[1],0])
			cube(_leg);
		translate([(side)/2,0,_leg[2]/2])
		for (i=[0:3])
		{
			translate([	cos(90*i)*(side+2*width+hole[0])/2-sin(90*i)*(side+2*width+hole[0])/2,0,
						sin(90*i)*(_leg[2]-hole[1])/2+cos(90*i)*(_leg[2]-hole[1])/2])
			rotate(90,[1,0,0])
				#cylinder(h=_leg[1],d=hole[2]);
		}
	}
}

module wireclamp()
{
	size=[4.2,11,8];
	dy=1; y=0.5;
	width=1; cham1=0.8;cham2=0.8;
	difference()
	{
		translate([-width,0,0])
			chamfercube([size[0]+2*width,size[1]+width+dy,size[2]],cham1);
		translate([0,y,0])
			chamfercube([size[0],size[1]+dy-y,size[2]],cham2);
		translate([cham2,0,0])
			cube([size[0]-2*cham2,y,size[2]]);
	}
}

module hat()
{
	rod=[4.0+0.1,20]; // d, height
	hat=[13.6,25]; // dbot, height
	hexnut=[7.7+0.2,3]; // corner to corner diameter, height
	lh=0.2; // layer height

	difference()
	{
		rotate_extrude($fn=6)
		{
			//polygon([[0,0],[hat[0]/2,0],[0,hat[1]]]);

			points=[for (i=[0:0.3:hat[1]]) [abs( 1+hat[0]/2-pow(2.71828,(i/hat[1]*ln(hat[0]/2))) ),i]];
			polygon(concat(points,[[0,hat[1]],[0,0],[hat[0]/2,0]]));
		}
		cylinder(d=hexnut[0],h=hexnut[1],$fn=6);
		cylinder(d=rod[0],h=rod[1]);

		// the nut will fall in easier
		cylinder(d=hexnut[0]+0.4,h=lh,$fn=6);
	}
}
