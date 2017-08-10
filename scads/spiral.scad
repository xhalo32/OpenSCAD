p=6; a=20; b=15; f=2; warp=0;
points=[ for (i=[0:p]) for (j=[0:1]) [(a+b*j*f)*cos((i+j*warp)*360/p),(a+b*j*f)*sin((i+j*warp)*360/p)] ];


linear_extrude(100,twist=360/p*3,slices=1000)
{
	r=6;
	offset(r/2,$fn=60)
	offset(-r,$fn=60)
	polygon(points);
}

/*
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
*/
