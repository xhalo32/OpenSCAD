$fn=100;
ring_d=[16.5,2.2];
ring_h=[2.5,3.7];

ring=[
	[0,0],
	[ring_d[1],0],
	[ring_d[1],0.9*ring_h[1]],
	[0.8*ring_d[1],ring_h[1]],
	[0.5*ring_d[1],ring_h[1]],
	[0,ring_h[0]],
];

cap_h=[10.3,3];
cap=[19.5,19.4];


slide_cap();

// hd=4.5 wd=10 a=atan(wd/hd) centrala=180-2*a r*sin(centrala)=wd -> wd/sin(centrala)=r; centrala !% 180; wd!=0

sphere_radius=10/sin(180-2*atan(10/4.5));


module slide_cap()
{
	difference()
	{
		union()
		{
			rotate(180,[1,0,0])
				rotate_extrude()
					translate([ring_d[0]/2-ring_d[1],0,0])
						polygon(ring);

			for (i = [-1:2:1])
			{
				
				translate([-1.75,i*( ring_d[0]/2-.5 ),-3.5+1.7])
					mirror([0,-i/2+.5,0])
						rotate(90,[0,1,0])
						linear_extrude(3.7)
							polygon([ [0,0],[1.7,0],[0.7,1.2],[0,1.2] ]);
			}
		

			intersection()
			{
				translate([cap[0]/2-4.3,-22/2,0])
					cube([4.3,22,cap_h[0]]);

				union()
				{
					translate([1.8*sphere_radius-cap[1]/2+3,0,cap_h[1]])
						scale([1.8,1,0.6])
							sphere(sphere_radius);	
					translate([-cap[1]/2,-cap[1]/2-4.3,0])
						cube([cap[0],cap[0]+2*4.3,cap_h[1]]);
				}
			}

			hull()
			{
				cylinder(cap_h[1],d=cap[1]);

				intersection()
				{
					union()
					{
						cylinder(cap_h[0],d=cap[1]);
						translate([0,-cap[1]/2,0])
							cube([cap[0]/2,cap[1],cap_h[0]]);
					}
					translate([1.8*sphere_radius-cap[1]/2+3,0,cap_h[1]])
						scale([1.8,1,0.6])
							sphere(sphere_radius);
				}
			}
		}

		union()
		{
			translate([-cap[1]/2+4.8,-6.4/2,-5])
				cube([cap[0]-4.8,6.4,30]);

			translate([-cap[1]/2+0,-8.5/2,3.6])
				cube([cap[0],8.5,10]);

			difference()
			{
				translate([cap[0]/2-2,-cap[1]/2-5,2])
					rotate(-90,[1,0,0])
						cylinder(cap[0]+10,d=1.6);

				translate([-cap[1]/2+0,-5,0])
					cube([cap[0],10,10]);
				
			}
		}
	}
}