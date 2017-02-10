radius = 16;
sides = 5;
thickness = 1.5;
baseheight = 1;
bodyheight = 20;
bodytwist = 72;
bodyslices = 10;
bodyscale = 1.3;

rimheight=1;

module poly( solid )
{
	
	difference()
	{
		offset( 5, $fn=48 )
			circle( r=radius, $fn=sides );
		if (solid==false)
		{
			offset( r=5-thickness, $fn=48 )
				circle( r=radius, $fn=sides );
		}
	}

}

linear_extrude( height=baseheight )
	poly();

translate([0,0,baseheight])
linear_extrude( height=bodyheight, twist=bodytwist, slices=bodyslices, scale=bodyscale )
	poly(false);

translate([0,0,bodyheight+baseheight])
rotate(-bodytwist, [0,0,1])
scale(bodyscale)
linear_extrude(height=rimheight)
		poly(false);
