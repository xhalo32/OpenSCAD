$fn=50;

plate_size=[300,350];

wheel_diameter=[60,65];
wheel_height=[24,1.5];

wheel_hole_diameter=[10,13.5];
wheel_hole_depth=5.5;

wheel_pos=[[0,plate_size[0]],[60, plate_size[1]-60],10];


// OUTPUT

/*
plate();

for (i = [0:1])
{
		
	for (j = [0:1])
	{
		translate([wheel_pos[0][j],wheel_pos[1][i],wheel_pos[2]])
			rotate(90*(2*j-1),[0,1,0])
				wheel();
		
	}
}
*/

rotate(-90,[0,1,0])
	wheel();

wheel_mount();


// MODULES

module wheel()
{
	difference()
	{
		union()
		{
			cylinder(wheel_height[0], d=wheel_diameter[0]);
			cylinder(wheel_height[1], d=wheel_diameter[1]);
			translate([0,0,wheel_height[0]-wheel_height[1]])
				cylinder(wheel_height[1],d=wheel_diameter[1]);
		}
		union()
		{
			cylinder(wheel_height[0], d=wheel_hole_diameter[0]);

			cylinder(wheel_hole_depth, d=wheel_hole_diameter[1]);
			translate([0,0,wheel_height[0]-wheel_hole_depth])
				cylinder(wheel_hole_depth, d=wheel_hole_diameter[1]);
		}
	}
}

module plate()
{
	cube(concat(plate_size, 3));
}

module wheel_mount()
{
	difference()
	{
		union()
		{
			translate([0,-25,-10])
			cube([20,50,8]);
			
			translate([0,-10,-10])
			difference()
			{
				cube(20);
				translate([10,0,20])
					rotate(45,[0,1,0])
						cube(20);
			}
		}
		union()
		{
			rotate(90,[0,1,0])
				cylinder(50, r=4);
			
			for (i = [-1:2:1])
			{
				translate([10,i*17.5,-10])
				cylinder(10, r=3);
			}
		}		
	}
}