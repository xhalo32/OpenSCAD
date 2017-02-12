inner=6;
outer=20;
screwhole=5 + 0.3;
height=4;

stock=5;
stockheight=4;

module mount(length=30, holes=1)
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

l=30;
mount_height=50;
mount_hole=3.2;
screw_depth=28;


union()
{
	translate([0,l,0])
		rotate(180,[1,0,0])
			mount(length=l, holes=1.5);
	difference()
	{
		cube([outer, 3*mount_hole, mount_height]);
		translate([outer/2,1.5*mount_hole,mount_height-screw_depth])
			cylinder(d=mount_hole, h=screw_depth, $fn=20);
	}
}