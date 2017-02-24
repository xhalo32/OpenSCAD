use<op3_v2.scad>;

phone=[153, 75.3, 7.8];
op_camera=[28, 22, 5];

case=[2, 2, 0];
case_rounding=6;
case_rounding_sphere=1;

phone_height=0.7;
case_thickness=0.2;


case_hole_bot_loc=[case[0]+phone[1]/10, 9*phone[1]/10-2*case[0], 7];
case_hole_bot=[1,10];


clearance_phone=phone;
clearance_height=3;
clearance_rounding=0;
s_scale=[1,1,1];


intersection()
{
	!op3_case();
	//translate([0,phone[1]+2*case[1]-20,0])
	cube([40,40,30]);
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
			sphere(case_rounding_sphere, $fn=40);
		}*/
		

		
		translate([case_rounding_sphere, case_rounding_sphere, case_rounding_sphere])
			translate([case_rounding, case_rounding, case_thickness])
			minkowski()
			{
				minkowski()
				{
					cube([ phone[0]+case[0]-2*case_rounding-2*case_rounding_sphere, 
						phone[1]+case[1]-2*case_rounding-2*case_rounding_sphere,
						phone[2]+case[2]-2*case_rounding_sphere-case_thickness]);

					cylinder(0.00001,case_rounding, $fn=40);
				}
				sphere(case_rounding_sphere, $fn=40);
			}


		translate([case[0]/2,case[1]/2,phone_height])
			op3_v2(op_camera);

		// bottom hole
		translate([phone[0]-5,phone[1],case_hole_bot_loc[2]])
		rotate(-90,[0,0,1])
			rotate(-90,[1,0,0])
				hull()
				{
					translate([case_hole_bot_loc[0],0,0])
						cylinder(case_hole_bot[0]+10, d=case_hole_bot[1]);
					
					translate([case_hole_bot_loc[1],0,0])
						cylinder(case_hole_bot[0]+10, d=case_hole_bot[1]);
				}

	}
}