$fn=30;
side=20;
h=40;
height=sqrt(0.75)*side;



linear_extrude(h,twist=120,slices=100)
	difference()
	{
		offset(r=0.4)
			circle(d=side, $fn=6);
		offset(r=0)
			circle(d=side, $fn=6);		
	}


linear_extrude(h,twist=120,slices=100)
	difference()
	{
		offset(r=1.4)
			circle(d=side, $fn=6);
		offset(r=1)
			circle(d=side, $fn=6);		
	}