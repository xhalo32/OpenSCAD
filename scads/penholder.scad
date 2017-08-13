$fn=100;
penr=15.4/2;
pens=3;
height=20;
angle=15;
use <utils.scad>;


penholder();


module penholder()
{
	difference()
	{
		roundcube([pens*penr*3+penr+2*sin(angle)*height,3*penr,height],penr);
		for (i=[0:pens-1])
		{
			translate([2*penr+3*i*penr,3/2*penr,0])
			rotate(angle,[0,1,0])
			{
				translate([0,0,-100])
					#cylinder(h=height+200,r=penr);
			}
		}
	}
}
