$fn=100;


color([1, 1, 1,0.3])
*translate([5,0,-5])
	cube([5,18,5]);


rotate(90,[1,0,0])
rotate(-61.54,[0,0,1])
trigger_mech();



module trigger_mech()
{
	height=4.3;

	do=6.8;
	di=3.2;
	dh=6.2;
	xyz=[14.1,14.55,0];

	difference()
	{
		union()
		{
			linear_extrude(height)
			{
				scale(0.0365)
				import("profiles/trigger_mech.dxf");
			}

			l=12/1000;
			translate([578*l,1348*l,-7+height])
			color("cyan")
			linear_extrude(7)
			{
				scale(0.05)
				import("profiles/trigger_mech_thing.dxf");
			}

			color("green")
			translate(xyz)
				cylinder(dh, d=do);

			color("green")
			translate([7.5,13.2,0])
				cylinder(dh, d=2.6);
		}

		translate(xyz)
			cylinder(dh+1, d=di);

		union()
		{
			assign(xyz=[4.5,5,-1],
				d=5, delta=[2,-1,0])
			{
				hull()
				{
					translate(xyz)
						cylinder(dh+1, d=d);
					
					translate([
			xyz[0]+delta[0],
			xyz[1]+delta[1],
			xyz[2]+delta[2]])
						cylinder(dh+1, d=d);
				}
			}
			
		}
	}
}