use<op3_v2.scad>;

phone=[153, 75, 8];
case=[2, 2, 0];
case_rounding=7;
case_rounding_sphere=1;

phone_height=1;


case_hole_top_loc=[case[0]+phone[1]/8, 7*phone[1]/8-2*case[0], 4];
case_hole_top=[1,0];


case_hole_bot_loc=[case[0]+phone[1]/10, 9*phone[1]/10-2*case[0], 6];
case_hole_bot=[1,10];


clearance_phone=phone;
clearance_height=3;
clearance_rounding=0;
s_scale=[1,1,1];


intersection()
{
	op3_case();
	cube(30);
}


module op3_case()
{
	difference()
	{
		/*translate([case_rounding_sphere, case_rounding_sphere, case_rounding_sphere])
		minkowski()
		{
			cube([ phone[0]+case[0]-2*case_rounding_sphere, 
				phone[1]+case[1]-2*case_rounding_sphere,
				phone[2]+case[2]-2*case_rounding_sphere]);
			sphere(case_rounding_sphere, $fn=20);
		}*/
		

		
		translate([case_rounding_sphere, case_rounding_sphere, case_rounding_sphere])
			translate([case_rounding, case_rounding, 0])
			minkowski()
			{
				minkowski()
				{
					cube([ phone[0]+case[0]-2*case_rounding-2*case_rounding_sphere, 
						phone[1]+case[1]-2*case_rounding-2*case_rounding_sphere,
						phone[2]+case[2]-2*case_rounding_sphere]);

					cylinder(0.00001,case_rounding, $fn=20);
				}
				sphere(case_rounding_sphere, $fn=20);
			}


		translate([case[0]/2,case[1]/2,phone_height])
			op3_v2([22, 5]);

		// top hole (there's none)
		translate([0,phone[1],case_hole_top_loc[2]])
		rotate(-90,[0,0,1])
			rotate(-90,[1,0,0])
				hull()
				{
					translate([case_hole_top_loc[0],0,0])
						cylinder(case_hole_top[0]+5, d=case_hole_top[1]);
					
					translate([case_hole_top_loc[1],0,0])
						cylinder(case_hole_top[0]+5, d=case_hole_top[1]);
				}

		// bottom hole
		translate([phone[0],phone[1],case_hole_bot_loc[2]])
		rotate(-90,[0,0,1])
			rotate(-90,[1,0,0])
				hull()
				{
					translate([case_hole_bot_loc[0],0,0])
						cylinder(case_hole_bot[0]+5, d=case_hole_bot[1]);
					
					translate([case_hole_bot_loc[1],0,0])
						cylinder(case_hole_bot[0]+5, d=case_hole_bot[1]);
				}

	}
}