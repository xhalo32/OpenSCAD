height=110;
depth=8.9;
dg=26;
dg_h=9.6;
width=24.5;

tiny=pow(10,-6);

$fn=10;

angle=atan(9.6/26);


1
base();

translate([-10.93,depth])
	rotate(-angle+atan(9/50),[0,1,0])
	rotate(90,[1,0,0])
		translate([0,-1.8+15 ,0])
			magazine_r();



module base()
{
assign(w=26,h=9)
{
	difference()
	{
		rotate_extrude()
		{
			square([20,9]);

			translate([20,0])
			scale(0.0789)
			import("base.dxf");
		}
		
		translate([-40,-w/2-30,-1])
			cube([80,30,9+1]);

		translate([-40,w/2,-1])
			cube([80,30,9+1]);

		translate([16,-w/2,-1])
			cube([30,w,9+1]);

		assign(dg=50,z=2)
		{
			translate([16,0,z])
			rotate(atan(h/dg),[0,1,0])
				translate([-dg,-w/2])
				cube([dg+10,w,h]);
		}
	}

	//connector
	color("purple")
	assign(x=3.6-4,w=12.3,he=15,d=14)
	{
		translate([x,-d/2])	
			rotate(-angle,[0,1,0])	
			rotate(atan(h/50),[0,1,0])	
				cube([w,d,he]);
	}
}
}

module magazine_r()
{
	difference()
	{
		linear_extrude(depth)
		polygon([
				[0,dg_h],
				[width,0],
				[width,height],
				[0,height+dg_h],
			]);

		//slope *hard
		color("magenta")
		assign(h=25, dd=8.8-6.3)
		{
			translate([0,height+dg_h-h,-5])

			rotate(atan(dd/h)/2,[0,-1,0])
				rotate(atan(dd/h),[1,0,0])
					rotate(-angle,[0,0,1])
						translate([-35,-35,0])
							cube([100,100,5]);
		}

		//spring hole
		color("gray")
		assign(h=5.5, d=6.6, w=2.25)
		{
			translate([w,0,h])
				cube([d,height+dg_h,d]);
		}
		
		//bb slope cut
		color("white")
		assign(h=3.5, d=depth-5.5)
		{
			translate([0,height+dg_h-h,depth-d])
				rotate(-angle-15,[0,0,1])
					translate([-dg/2,0])
					cube([0.7*dg, 2*h, d+1]);
		}

		//trigger cut
		color("green")
		assign(
			y=height, x=width, z=depth-1.9,
			h=11.2, w=17, a=180+angle)
		{
			translate([x, y, z])
				rotate(a,[0,0,1])
				translate([2,-h,0])
				cube([w,h,depth-z+1]);
				
			translate([x-3-1.85, y-0.7, z])
			cube([3,h,depth-z+1]);
		}

		//roundings
		color("yellow")
		assign(rr=1)
		{
			translate(
		[rr-tiny,0,rr-tiny])
			rotate(90,[0,1,0])
				rotate(-90,[1,0,0])
					cqpipe(height+dg_h,rr);
			
			translate(
		[width-rr,0,rr-tiny])
				rotate(-90,[1,0,0])
					cqpipe(height+dg_h,rr);

			translate(
		[rr-tiny,height+dg_h-rr,rr-tiny])
				rotate(90,[0,0,1])

					cqpipe(height+dg_h,rr);
			translate(
		[width-rr+tiny,height-rr,rr-tiny])
				scale([1,1.5,1])
				rotate(0,[0,0,1])
					cqpipe(height+dg_h,rr);
		}

		//base slot
		color("purple")
		assign(x=10.25,
			h=15,w=12.5,d=7)
		{
			translate([x,0,depth-d])
			cube([w,h,d]);
		}
	}
}

module cqpipe(height, radius)
{
	difference()
	{
		cube([radius,radius,height]);
		intersection()
		{
			cylinder(height,r=radius);
			cube([radius*2,radius*2,height]);
		}
	}
}