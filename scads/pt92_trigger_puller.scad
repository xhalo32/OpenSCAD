$fn=60;


end=70;
y=1;
z=-1;
*for (i = [0:end-1])
{
	translate([i,y,z])
		color([ceil(((i+1)%10)/9), i%2, i%2])
			cube([1,1,1]);
}

trigger_puller();



module trigger_puller()
{
	difference()
	{
		intersection()
		{
			translate([0,10,0])
			rotate(90,[1,0,0])
			linear_extrude(10)
			{
				scale(0.0618)
				import("profiles/trigger_puller.dxf");
			}


			translate([69.5,0,20])
			rotate(180,[0,1,0])
			linear_extrude(20)
			{
				scale(0.0615)
				import("profiles/trigger_puller_side.dxf");
			}
			
		}
		
		#translate([0,4,0])
			cube([100,5,4.4]);

		translate([41,3,6.52])
			cube([9.7,5,5]);

		#translate([41,3,0])
			cube([12,5,4.4]);

		translate([0,0,0])
			cube([100,1.518,4.4]);
	}
	
	translate([-5.5/2+15.15,0,8.28])
		rotate(90,[1,0,0])
			difference()
			{
				union()
				{
					cylinder(7.3,d=5.5);
					translate([0,0,7.3])
					cylinder(4.6,d=3.8);	
				}
				cylinder(7.3+4.6+1,d=2);
			}

	translate([66.2,1.6,7.8])
		rotate(90,[1,0,0])
			difference()
			{
				union()
				{
					cylinder(7.5,d=6.5);
					translate([0,0,7.3])
					hull()
					{
						cylinder(5.6,d=4);
						translate([-0.8,-0.8,0])
						cylinder(5.6,d=4);
					}
				}
				cylinder(7.5+5.6+1,d=2);
			}

}