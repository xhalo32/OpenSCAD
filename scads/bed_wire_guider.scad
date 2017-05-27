plate_height=2.0;

clamp_width=35;
clamp_depth=20;
clamp_height=4;

final();

module clamp()
{
	translate([0,-30,0])
		cube([clamp_width,30,2*clamp_height+plate_height]);

	difference()
	{

		cube([clamp_width, clamp_depth, 2*clamp_height+plate_height]);
		translate([-100+clamp_width/2,0,clamp_height])
			cube([200,200,plate_height]);
	}

}
module final()
{
	clamp();
	radius = 20;
	size = 8;

	translate([clamp_width/2,-30+size,
		radius+plate_height+2*clamp_height])
	rotate(-90,[1,0,0])
	difference()
	{
		*rotate_extrude($fn=100)
		{
			translate([radius,0])
				circle(size);
		}
		gap=00;
		//radius*2*sin(180-angle/2)-2*size=10
		//180-angle/2 = asin( ( 10+2*size )/2radius )
		//360-angle = 2asin( (10+2*size)/radius )
		//360-2asin( (10+2size)/2radius ) = angle

		//-> radius*sin(180-angle/2)-size=gap/2
		// sin(180-angle/2) = (gap/2+size)/radius
		// 180-angle/2 = asin( (gap/2+size)/radius )
		// 360 - 2atan( (gap/2+size)/radius ) = angle

		angle=360-2*asin((2*gap+size)/radius);
		for (i = [0:2:angle+1])
		{
			rotate(i-angle/2+90,[0,0,1])
			translate([radius,0])
				sphere(size, $fn=15);
		}
		echo(radius*2*sin(180-angle/2)-2*size);

	}
}