$fn=60;

upper=[24,20,50];
insert=13.6+1.4; dx=5;

lower=[41.5,20+insert,47];
screws=[5,5,3];
diam=51.3; diams2=[4.5,7];
export=3;


%eaxis();
//fanmount();

radialfan(2);


module eaxis()
{
	cube(upper);
	translate([-dx,-insert,-lower[2]])
		cube(lower);
}
module fanmount()
{
	d=2;
	
	difference()
	{
		translate([0,-d,0])
			cube([upper[0],d,10]);
		for (i=[-1:2:1])
			translate([upper[0]/2+i*(upper[0]/2-screws[0]),-d,screws[1]])
				rotate(-90,[1,0,0])
					cylinder(h=d,d=screws[2]);
	}
	translate([0,-d-insert,-d])
		cube([upper[0],d+insert,d]);
	/*translate([-dx,-d-insert,-lower[2]])
		cube([lower[0],d,lower[2]]);*/

	translate([diam/2-dx,-insert,-diam/2+10])
		rotate(90,[1,0,0])
			difference()
			{
				xy=[-8.2,28.1];
				radialfan(d);
				translate([xy[0],xy[1],0])
					hull()
					{
						cylinder(h=d,d=25);
						translate([100,0,0])
							cylinder(h=d,d=25);
					}
			}
}

module radialfan(height=15)
{
	exhauser=[20,diam/2+3,height];
	cylinder(d=diam,h=height);
	translate([-diam/2,-exhauser[1],0])
		cube(exhauser);
	dh=sqrt(0.5);

	difference()
	{
		hull()
		{
			translate([-diam/2+diams2[1]/2+dh,19-dh,0])
				cylinder(h=height,d=diams2[1]);
			cylinder(h=height,d=diams2[1]);
		}
		translate([-diam/2+diams2[1]/2+dh,19-dh,0])
			cylinder(h=height,d=diams2[0]);
	}
	difference()
	{
		hull()
		{
			translate([diam/2-diams2[1]/2-dh,-19+dh,0])
				cylinder(h=height,d=diams2[1]);
			cylinder(h=height,d=diams2[1]);
		}
		translate([diam/2-diams2[1]/2-dh,-19+dh,0])
			cylinder(h=height,d=diams2[0]);
	}
}
