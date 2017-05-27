$fn=100;

pituus=77;
leveys=30;

pala();

module alusta()
{
	syvyys=4.5;
	reika=10;
	pienoreika=5;
	
	difference()
	{
		difference()
		{
			minkowski()
			{
				translate([0.5,.5,-0.5])
				cube([pituus-1,leveys,syvyys]);
				sphere(d=1);
			}
			translate([0,0,-2])
			cube([pituus,leveys,2]);
			
			translate([0,leveys,-10])
			cube([pituus,leveys,20]);
		}
		for (i = [0:1])
		{
			translate([i*(pituus-2*8)+8,9,0])
			{
				translate([0,0,1.5]) cylinder(syvyys, d=reika);
				cylinder(syvyys, d=pienoreika);
			}
			
			translate([i*(pituus-2*27)+27,15,0])
			{
				translate([0,0,1.5]) cylinder(syvyys, d=reika);
				cylinder(syvyys, d=pienoreika);
			}
		}
	}
}

module kiinnike()
{
	
	syvyys=4;
	difference()
	{
		hull()
		{
			translate([0.5,-0.5,0])
			cylinder(syvyys,r=0.5);
			
			translate([pituus/2,0,0])
			cylinder(syvyys,r=25.5);
			
			translate([pituus-0.5,-0.5,0])
			cylinder(syvyys,r=0.5);
			
		}
		
		translate([0,-100,0]) cube([pituus,100,syvyys]);
		translate([pituus/2,25.5-11.2,0]) cylinder(syvyys,d=6.8);
	}
	
	
	for (i = [0:1])
	{
		translate([i*(pituus-2*17)+17-i*3,0,syvyys])
		difference()
		{
			cube([3,15,12]);
			translate([0,0,12]) rotate(-atan(12/15),[1,0,0]) cube([3,100,100]);
		}
		
	}    
}

module pala()
{
	alusta();
	
	translate([0,leveys,4.5]) rotate(90,[1,0,0]) kiinnike();
	
}








