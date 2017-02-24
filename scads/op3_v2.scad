$fn=40;

phone=[153, 75.3, 7.8];

phone_edge=12;
phone_edge_r=37;

rounding=1.7;
s_scale=[3.5,3.5,1];

camera=[20, 15, 1.5];
camera_rounding=3;
camera_loc=[13+camera[0]/2, phone[1]/2];

			//	POS1 POS2  h   len
volumeslider_loc=[20, 60, 4, 1];
volumeslider=[10, 10];

powerbutton_loc=[47, 59, 4, 1];
powerbutton=[10, 10];

usbport_loc=[phone[1]/2-5, phone[1]/2+5, 3.5, 2];
usbport=[2, 6];

headphone_loc=[phone[1]/2+18, 3.5, 2];
headphone=[2, 6];


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
						cylinder(phone[0],d=phone[1], $fn=150);
		
			translate([phone[0]/2,0,phone[2]/2])
				scale([1,1,0.25])
					rotate(-90,[1,0,0])
						cylinder(phone[1],d=phone[0], $fn=150);

		}
		// bottom edge roundings
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
				cylinder(phone[0]+2,r=phone_edge_r, $fn=150);
						}
		}
	}

	// camera
	translate([camera_loc[0], camera_loc[1], -camera[2]+camera_rounding])
	minkowski()
	{
		cube([camera[0]-2*camera_rounding,
			camera[1]-2*camera_rounding,
			camera[2]], center=true);
		difference()
		{
			sphere(r=camera_rounding);
			translate([-camera_rounding,-camera_rounding,0])
				cube(2*camera_rounding);
		}
	}

	// volume and alert slider
	translate([0,volumeslider_loc[3],volumeslider_loc[2]])
	rotate(90,[1,0,0])
		union()
		{
			hull()
			{
				translate([volumeslider_loc[0],0,0])
					cylinder(volumeslider[0], d=volumeslider[1]);
				
				translate([volumeslider_loc[1],0,0])
					cylinder(volumeslider[0], d=volumeslider[1]);
			}
			// extra cylinder for cleaner look
			difference()
			{
				hull()
				{
					translate([volumeslider_loc[0],0,-volumeslider[0]])
						cylinder(volumeslider[0], d=volumeslider[1]);
					
					translate([volumeslider_loc[1],0,-volumeslider[0]])
						cylinder(volumeslider[0], d=volumeslider[1]);
				}
				translate([0,-volumeslider[1],-volumeslider[0]])
				cube([volumeslider_loc[0]+volumeslider_loc[1],
					volumeslider[1],
					volumeslider[1]]);
			}
			
		}

	// power button
	translate([0,phone[1]-powerbutton_loc[3],powerbutton_loc[2]])
	rotate(-90,[1,0,0])
		union()
		{
			hull()
			{
				translate([powerbutton_loc[0],0,0])
					cylinder(powerbutton[0], d=powerbutton[1]);
				
				translate([powerbutton_loc[1],0,0])
					cylinder(powerbutton[0], d=powerbutton[1]);
			}
			// extra cylinder for cleaner look
			difference()
			{
				hull()
				{
					translate([powerbutton_loc[0],0,-powerbutton[0]])
						cylinder(powerbutton[0], d=powerbutton[1]);
					
					translate([powerbutton_loc[1],0,-powerbutton[0]])
						cylinder(powerbutton[0], d=powerbutton[1]);
				}
				translate([0,0,-powerbutton[0]])
				cube([powerbutton_loc[0]+powerbutton_loc[1],
					powerbutton[1],
					powerbutton[1]]);
			}
			
		}

	// usb port
	translate([phone[0]+usbport_loc[3],0,usbport_loc[2]])
	rotate(90,[0,0,1])
		rotate(-90,[1,0,0])
		union()
		{
			hull()
			{
				translate([usbport_loc[0],0,0])
					union()
					{
						cylinder(usbport[0], d=usbport[1]);
						translate([0,0,usbport[0]])
						sphere(d=usbport[1]);
					}
				
				translate([usbport_loc[1],0,0])
					union()
					{
						cylinder(usbport[0], d=usbport[1]);
						translate([0,0,usbport[0]])
						sphere(d=usbport[1]);
					}
			}
			
		}

	// headphone jack
	translate([phone[0]+headphone_loc[2],0,headphone_loc[1]])
	rotate(90,[0,0,1])
		rotate(-90,[1,0,0])

		translate([headphone_loc[0],0,0])
			union()
			{
				cylinder(headphone[0], d=headphone[1]);
				translate([0,0,headphone[0]])
				sphere(d=headphone[1]);
			}

}