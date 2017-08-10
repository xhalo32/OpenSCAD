a=6;
c=0;
d=0.8;
b=2;

/*
_points=[for (i=[0:5]) [a*(b-d*floor(i/2)+c)*sin(90*i+45),a*(b-d*floor((i-1)/2)+c)*cos(90*i+45)]];
p=[_points[0][0],_points[0][1]+10];
points=concat([p],_points);
*/

width=6.22;
points2r=2.49;
points2=[[0,0],[33,-20],[33,-30-20],[33,-20],[33+width+2*points2r,-20],[33+width+2*points2r,-30-20]];

$fn=20;


filaguider();


module filaguider()
{
	/*
	rotate(-90,[0,0,1])
		difference()
		{
			cylinder(h=5,r1=18,r2=20,$fn=60);
			minkowski()
			{
				linear_extrude(0.1)
				{
					polyline(points,0.1);
				}
				cylinder(h=5,r=1.9,r2=2.8);
			}
		}
	*/
	
	difference()
	{
		cylinder(h=5,r1=10,r2=8,$fn=60);
		d=3.7;
		d_i=2.6;
		d_o=10;
		d_t=1.35;
		#hull()
		{
			translate([0,0,0])
			cylinder(h=5,r1=d_o/2,r2=d_i/2);
			cylinder(h=5,r1=d_o/2,r2=d_i/2);
		}
		#hull()
		{
			translate([0,0,0])
			cylinder(h=5,r1=d_i/2,r2=d_t/2);
			translate([0,-5,0])
			cylinder(h=5,r1=d_i/2,r2=d_t/2);
		}
		#hull()
		{
			translate([0,-d,0])
			cylinder(h=5,r1=d_i/2,r2=d_i/2);
			translate([0,-10,0])
			cylinder(h=5,r1=d_i/2,r2=d_i/2);
		}
	}

	translate([8-1,5,2.5])
	rotate(90,[1,0,0])
	difference()
	{
		minkowski()
		{
			linear_extrude(0.1)
			{
				polyline(points2,0.005);
			}
			cylinder(h=10,r=points2r);
		}
		r=6;
		translate(points2[1])
		translate([-r,-36.2])
		#minkowski()
		{
			linear_extrude(0.1)
			{
				polyline([[0,0],[0,30]],0.005);
			}
			cylinder(h=10,r=r,$fn=30);
		}
	}
}

module line(p1,p2,r)
{
	hull()
	{
		translate(p1)
			circle(r);
		translate(p2)
			circle(r);
	}
}

module polyline(points,r)
{
	for (i=[0:len(points)-2])
	{
		line(points[i],points[i+1],r);
	}
}
