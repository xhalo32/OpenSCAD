$fn=60;


//dashcable();

//translate([15,0,0]) 
	mount_dashcable();


module dashcable(swell=[for (i=[0:6]) 0])
{
	length=17.9+swell[0]; width=12.05+swell[1]; depth=6.3+swell[2];
	color("lightgrey") hull()
	{
		cylinder(h=length,d=depth);
		translate([width-depth,0,0])
			cylinder(h=length,d=depth);
	}
	diams=[5.6+swell[3],3.6+swell[4]];
	height=[7+swell[5],10+swell[6]];
	color("darkred") translate([width/2-depth/2,0,0])
	{
		for (i=[0:1])
		{
			translate([0,0,-height[i]])
				cylinder(h=height[i],d=diams[i]);
		}
	}
}
module mount_dashcable()
{
	h=7;
	length=17.9+h; width=12.05+2; depth=6.3+2;
	d=3;
	_d=(depth-(depth-2+0.2))/2;
	translate([width/2-depth/2-10,(depth-2+0.2)/2,0])
		cube([20,2,length]);

	difference()
	{
		color("grey") hull()
		{
			cylinder(h=length,d=depth);
			translate([width-depth,0,0])
				cylinder(h=length,d=depth);
		}
		translate([0,0,h])
			dashcable([0,0.2,0.2,0.5,0,0,0]);
		translate([width/2-depth/2,-depth/2,0])
		{
			translate([-d/2-_d/2,0,0])
				cube([d+_d,depth/2,100]);
		}
	}
	for (i=[-1:2:1])
	{
		translate([width/2-depth/2+i*(-d/2-_d/2),-depth/2+_d/2,0])
			cylinder(h=length,d=_d);
	}
}
