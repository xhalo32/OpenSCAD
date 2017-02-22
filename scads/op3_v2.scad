$fn=40;

phone=[153, 75, 8];

phone_edge=12;
phone_edge_r=37;

rounding=2;
s_scale=[3.5,3.5,1];

camera=[15, 1.5];
camera_rounding=3;
camera_loc=[12+camera[0]/2, phone[1]/2];

volumeslider_loc=[16, 64, 5];
volumeslider=[1, 5];

powerbutton_loc=[42, 62, 5];
powerbutton=[1, 5];


op3_v2();

module op3_v2(camera=camera)
{
	difference()
	{
		intersection()
		{
			translate(
				[rounding*(s_scale[0]),
				rounding*(s_scale[1]),
				0])						//*(s_scale[2]) if not halfsphere
			minkowski()
			{
				cube([phone[0]-2*rounding*s_scale[0],
					phone[1]-2*rounding*s_scale[1],
					phone[2]-rounding*s_scale[2]]);	// 2*roundig if not...

				//cylinder(pow(10,-10),r=rounding);
				scale(s_scale)
				difference()
				{
					sphere(rounding);
					translate([-rounding,-rounding,-2*rounding])
					cube(2*rounding);
				}
			}
			
			translate([0,phone[1]/2,phone[2]/2])
				scale([1,1,0.3])
					rotate(90,[0,1,0])
						cylinder(phone[0],d=phone[1], $fn=100);
		
			translate([phone[0]/2,0,phone[2]/2])
				scale([1,1,0.25])
					rotate(-90,[1,0,0])
						cylinder(phone[1],d=phone[0], $fn=100);

		}
		
		for (i = [-1:2:1])
		{
			translate([-1,
				phone_edge*-i+phone[1]*(i/2+0.5),
				phone_edge_r-0.001])
				rotate(90,[0,1,0])
					rotate(-45+i*45,[0,0,1])
						difference()
						{
				cube([phone_edge_r, phone_edge_r, phone[0]+2]);
				cylinder(phone[0]+2,r=phone_edge_r, $fn=100);
						}
		}
	}

	// camera
	translate([camera_loc[0], camera_loc[1], -camera[1]+camera_rounding])
	minkowski()
	{
		cube([camera[0]-2*camera_rounding,
			camera[0]-2*camera_rounding,
			camera[1]], center=true);
		difference()
		{
			sphere(r=camera_rounding);
			translate([-camera_rounding,-camera_rounding,0])
				cube(2*camera_rounding);
		}
	}

	// volume and alert slider
	translate([0,5,volumeslider_loc[2]])
	rotate(90,[1,0,0])
		hull()
		{
			translate([volumeslider_loc[0],0,0])
				cylinder(volumeslider[0]+5, d=volumeslider[1]);
			
			translate([volumeslider_loc[1],0,0])
				cylinder(volumeslider[0]+5, d=volumeslider[1]);
		}

	// power button
	translate([0,-5+phone[1],powerbutton_loc[2]])
	rotate(-90,[1,0,0])
		hull()
		{
			translate([powerbutton_loc[0],0,0])
				cylinder(powerbutton[0]+5, d=powerbutton[1]);
			
			translate([powerbutton_loc[1],0,0])
				cylinder(powerbutton[0]+5, d=powerbutton[1]);
		}

}