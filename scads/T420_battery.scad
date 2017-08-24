$fn=100;
use <utils.scad>;

connector_top();

module connector_top()
{
	height=11; flatheight=0.5; heightm=4.85;
	widthl=31.6; widthl2=56.8; widthm=25; widthm0=3.3; widthm1=18.4;
	widthm2s=13; widthm2e=22.5; widthr1=2; widthr=66.3;
	depth=8;
	radius=5;

	widthtot=widthl+widthl2+widthm+widthm2e+widthr;

	translate([0,0,-flatheight])
		cube([widthtot,depth+radius,flatheight]);
	translate([widthl,0,0])
		roundcube1([widthl2,depth+radius,height],radius);
	translate([widthl+widthl2+widthm,0,0])
		difference()
		{
			roundcube1([widthm2e,depth+radius,height],radius);
			translate([widthm2e,depth+radius,0])
				rotate(-90-atan((widthm2e-widthm2s)/(depth+radius)),[0,0,1])
					cube([sqrt(pow(widthm2e-widthm2s,2)+pow(depth+radius,2)),100,height+0.1]);
		}
	translate([widthl+widthl2+widthm+widthm2s,0,0])
		difference()
		{
			cube([widthm2e-widthm2s,depth+radius,heightm]);
			translate([widthm2e-widthm2s,depth+radius,0])
				rotate(-90-atan((widthr1)/(depth+radius)),[0,0,1])
					cube([sqrt(pow(widthr1,2)+pow(depth+radius,2)),100,heightm+0.1]);
		}
	for (i=[0,1])
	{
		translate([widthl+widthl2,0,0])
			translate([i*(widthm-widthm0),0,0])
				cube([widthm0,depth+radius,heightm]);
	}
	translate([0,depth,0])
		roundcube1([widthtot,radius,height],radius);
}
