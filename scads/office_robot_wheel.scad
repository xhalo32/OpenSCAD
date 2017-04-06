diam = 57.5;
h = 22;
ledge=[2, 3];
supports=180;
supportd=0.9;
supportc=0.1;

$fn=100;


rotate_extrude()
{
	wheel_profile();
}

*wheel_support();



module wheel_profile()
{
	square([diam/2, h]);

	translate([0,h-ledge[0]])
	square([diam/2+ledge[1], ledge[0]]);
	square([diam/2+ledge[1], ledge[0]]);
}

module wheel_support()
{
	for (i = [0:supports])
	{
		rotate(360/supports*i,[0,0,1])
			translate([diam/2+ledge[1]-supportd/2,0,ledge[0]])
				cylinder(h-2*ledge[0]-supportc,d=supportd);
	}
	
}