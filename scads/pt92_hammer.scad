depth = 7.6;


$fn=100;


final();

module quarter(height, radius)
{
	difference()
	{
		cylinder(height, r=radius);

		translate([-radius, -radius])
			cube([2*radius, radius, height]);

		translate([-radius,0])
			cube([radius, radius, height]);
	}
}
module inquarter(height, radius)
{
	difference()
	{
		cube([radius, radius, height]);
		difference()
		{
			cylinder(height, r=radius);

			translate([-radius, -radius])
				cube([2*radius, radius, height]);

			translate([-radius,0])
				cube([radius, radius, height]);
		}
	}
}

module hammer()
{
	//height 19.2
	//width 7.1
	difference()
	{
		cube([7.1,19.2, depth]);

		translate([7.1-1.7, 19.2-1.7])
			inquarter(depth, 1.7);

		translate([2.7, 19.2+2])
			cylinder(depth,d=6.5);


		translate([0, 1.8])
		cylinder(depth,d=4.1);
	}
	difference()
	{
		linear_extrude(depth)
			polygon([
		[0,4],
		[-13.2+7.1,19.2-2],
		[0,19.2-2],
			]);
		
		translate([-9.7+7.1,19.2-2])
			cylinder(depth,d=4.5);
	}

	translate([-9.7+7.1,19.2-2])
	difference()
	{
		union()
		{
			cylinder(depth,d=7);
			for (i = [1:10])
			{
				rotate(150-8*i,[0,0,1])
				translate([7/2-0.1,0,0])
				cylinder(depth,d=0.4, $fn=20);
			}
		}
		cylinder(depth,d=4.5);
	}
}

module hammercon()
{
	difference()
	{
		scalefactor=1/12.3;
		linear_extrude(depth)
			scale(scalefactor)
				import("profiles/hammercon.dxf");
		// spring place
		// 5.3 + 2
		// height 4

		translate([10.8,5,4])
		difference()
		{
			cylinder(depth-4+1,d=5.3+2*1.6);
			cylinder(depth-4+1,d=5.3);
		}
		translate([10,-4,4])
			rotate(20,[0,0,1])
				cube([10,5,depth-4+1]);
	}
}

module final()
{
	
	difference()
	{
		union()
		{
			translate([3.6,10.8,0])
			rotate(-0.5,[0,0,1])
			hammer();

			hammercon();

			difference()
			{
				translate([12.34,0,0])
				rotate(28,[0,0,1])
				translate([0,-0.7,0])
					cube([2.5,3,4]);
				
				translate([14.25,0,0])
					cube([2,3,4]);
			}
		}
		
		translate([3.5,11,0])
			translate([0, 1.8])
				cylinder(depth,d=4.4);
	}

}