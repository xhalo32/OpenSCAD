motor_side = 42; 		//	in mm
motor_height = 40;

motor_cap_bot = 9.60;
motor_cap_top = 7.40;
motor_cap_bewel = 6;

motor_mid_bewel = 9.6;

motor_cover_length = 16;
motor_cover_height = 4;
motor_cover_depth = 3;


module bewelcube(side, height, amount)
{
	difference()
	{
		cube([side, side, height]);
		
		union()
		{
			for (s=[0:3]) // all sides
			{
				translate([	(s%2*4-1)*side/2+pow(-1,floor((s-1*floor(s/2)+1)/2)-ceil((s+1)%3/2)+1)*amount/sqrt(8),
							((s-1*floor(s/2)+1)%2*4-1)*side/2+pow(-1,floor((s+1*floor(s/2)-1)/2)-ceil((s+1)%3/2)+1)*amount/sqrt(8),
							0])

				cylinder(r=side, h=height, $fn=4);
			}
		}
	}
}

module motor()
{
	union()
	{
		bewelcube(motor_side, motor_cap_bot, motor_cap_bewel);
		bewelcube(motor_side, motor_height, motor_mid_bewel);
		translate([0,0, motor_height-motor_cap_top])
		bewelcube(motor_side, motor_cap_top, motor_cap_bewel);
		
		translate([motor_side-motor_cover_depth, (motor_side-motor_cover_length)/2, -motor_cover_height])
		cube([motor_cover_depth, motor_cover_length, motor_cover_height]);

	}

}
module wireholder()
{
	difference()
	{
		union()
		{
			//ring
			translate([0, -4, 15])
			cube([motor_side+4, motor_side+8, 10]);
			
			//clamp
			difference()
			{
				translate([motor_side+4, 4, 15])
				cube([10, motor_side-8, 10]);


				translate([motor_side+4, 4, 15])
				union()
				{
					cube([2, motor_side-14, 10]);
					translate([0, 6, 0])
					cube([6, motor_side-20, 10]);
				}
			}
		}
		#union()
		{
			translate([-motor_side/2, 1.5, 0])
			cube([motor_side, motor_side-3, motor_height]);

			motor();
		}
	}
}

wireholder();