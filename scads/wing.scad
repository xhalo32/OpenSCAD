$fn=30;

//wingholder();
batholder();

module wingholder()
{
	angle=[74,100];
	a=atan(angle[0]/angle[1]);
	height=1.5;
	width=[90,70];
	depth=10;

	translate([-width[0]/2,0,0])
		cube([width[0],depth,height]);

	for (i=[0:1])
	{
		mirror([i,0,0])
		translate([width[0]/2-0-depth*sin(a),depth-depth*cos(a),0])
			rotate(-a,[0,0,1])
				cube([width[1],depth,height]);
	}
}

module batholder()
{
	depth=23;
	width=40;
	height=[2,3];
	difference()
	{
		cube([width,depth,2*height[0]+height[1]]);
		translate([height[0],0,height[0]])
			cube([width-2*height[0],depth,height[1]]);
	}
}
