$fn=100;
seg=50;

spinner();

module spinner()
{
	w=26;h=40;
	r=(h-w/2-w/4)/tan(30);

	difference()
	{
		linear_extrude(6)
		union()
		{
			rotate(-60,[0,0,1])
			for (i = [0:2])
			{
				rotate(i*120,[0,0,1])
				{
					translate([-w/2,0])
						square([w,h-w/2]);
					translate([0,h-w/2])
						circle(d=w, $fn=seg);

				}
			}
			// r*tan30 = h-w/2-w/2*sin(30)
			// r = (h-w/2-w/2*sin30) / tan30

			difference()
			{
				circle( sqrt( pow(w/2,2)+pow(h-w/2,2) ) );
				for (i = [0:2])
				{
					rotate(i*120,[0,0,1])
						translate([0,w/2/cos(30)+r/cos(30)])
							circle(r, $fn=seg*2*r/w);
				}
			}
		}
		
		translate([0,0,-50])
		{
			for (i = [0:2])
			{
				rotate(60+i*120,[0,0,1])
					translate([0,h-w/2])
						cylinder(h=100,d=22);
			}	
			cylinder(h=100,d=22);
		}
	}
}