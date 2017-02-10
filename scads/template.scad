$fn = 20;


// variables
xObj_radius=25;
xObj_height=30;
xObj_gears=20;

xObj_gear_length=0;
xObj_gear_width=5;
xObj_gear_height=1;

xObj_hole_radius=10;


module xObj()
{
	difference()
	{
		union()		// Main piece
		{
			cylinder(r=xObj_radius, h=xObj_height);
			
			for(r=[0:xObj_gears])
			{
				rotate( [0,0,r*360/xObj_gears] )
				{
					translate(	[xObj_radius, 0, xObj_height/2] )
						cube( 
	[2*xObj_gear_length,
	xObj_gear_width
	,xObj_height*xObj_gear_height],
	center=true);
					translate(	[xObj_radius + xObj_gear_length, 0, xObj_height/2] )
						cylinder(
	r=xObj_gear_width/2,
	h=xObj_height*xObj_gear_height,
	center=true);
				}
			}


		}


		union()		// Pieces to remove
		{
			cylinder(r=xObj_hole_radius, h=xObj_height);
		}
	}
}




xObj();