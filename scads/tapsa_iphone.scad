base=[57.7,130,1.3];
delta=[1.2,0];
round=10;


rotate(90,[1,0,0])
	color("yellow")
	import("../stls/iphone6_6s_case_bolle.STL");


translate([base[0]/2+round/2+delta[0],-base[1]/2-round/2+delta[1],base[2]/2])
	minkowski()
	{
		cube([base[0]-round, base[1]-round, base[2]], center=true);
		cylinder(pow(10,-10),r=round, $fn=100);
	}