inner=6;
outer=20;
screwhole=5 + 0.15;
height=4;

stock=5;
stockheight=4;

track_height=4;

$fn=20;



translate([outer,0,0])
	rotate(180,[0,1,0])
		mount();

translate([10,20,8-track_height])
	rotate(-90,[1,0,0])
	{
		scale([1,1,1])
		wire_track();
		translate([-outer/2,12-height-track_height,0])
			cube([outer,height,20]);
		
	}



module wire_track()
{
	union()
	{
		difference()
		{
			minkowski()
			{
				difference()
				{
					cylinder(20,r=5.5);
					translate([-15,-2,10])
						scale([1,1,1.3])
							rotate(90,[0,1,0])
								cylinder(30,r=6.5);
				}

				sphere(4);
			}
			union()
			{
				translate([-20,-20,-50])
					cube([40,40,50]);

				translate([-20,-20,20])
					cube([40,40,50]);

				#translate([-20,12-track_height,0])
					cube([40,track_height,30]);
			}

		}
	}
}


module mount(length=30, holes=1.8)
{
	difference()
	{
		cube([outer,length,height]);
		
		union()
		{
			for(i=[1:holes])
			{
				translate([outer/2,i*length/(holes+1)])
					cylinder(d=screwhole,h=height,$fn=30);
			}
			
		}
	}
	
	translate([outer/2-inner/2,length-stock,height])
		cube([inner,stock,stockheight]);
	
	translate([outer/2-inner/2,0,height])
		cube([inner,stock,stockheight]);
	
}