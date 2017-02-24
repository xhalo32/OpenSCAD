radius = 15;
sides = 6;
thickness = 0.2;
baseheight = 0.3;
bodyheight = 30;
bodytwist = 60;
bodyslices = 100;
bodyscale = 2;

rimheight=0;

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
