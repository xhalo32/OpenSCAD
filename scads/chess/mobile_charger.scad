$fn=60;


color([0.3,0.8,0.3])
translate([0,2.5,0])
*dual();

bottom();

*top();
*button();

module _18650(y=0, d=0)
{
	rotate(-90,[1,0,0])
	cylinder(65+y,d=18.5+d);
}

module dual(hull=0,y=0,d=0)
{
	if(hull!=0)
	{
		hull()
		{
			translate([18+1,0,0])
			_18650(y,d);
			_18650(y,d);
		}
	}if(hull==0)
	{
		translate([18+1,0,0])
		_18650(y,d);
		_18650(y,d);
	}
}

module usb_charger()
{
	height=8.6+3; width=57.5; depth=27;

	translate([0,1,-10])
	cube([depth,70,height+10]);

	translate([0,6.5,0])
	union()
	{
		color([1/3,1/3,1/3])
		{
			//usb ports
			translate([-10,13.3,0])
			cube([20,14.5,7.7]);
		
			translate([-10,38.5,0])
			cube([20,14.5,7.7]);

			h=6.2;
			translate([-10,13.3+14.5,7.7-h])
			cube([20,38.5-13.3-14.5,h]);

			//switch
			translate([7.3,0,3.4])
			rotate(90,[1,0,0])
			cylinder(10,d=4.4);

			//lcd
			translate([10,18,height])
			cube([16,28.5,10]);

			//led
			translate([7,width,7.5-2.5])
			rotate(-90,[1,0,0])
			cylinder(10,d=5);

			translate([7,width+1,7.5-2.5])
			rotate(-90,[1,0,0])
			hull()
			{
				cylinder(7,d=5);
				translate([0,15])
				cylinder(7,d=5);
			}
		}
	}
}

module bottom()
{
	union()
	{
		difference()
		{
			translate([0,-2,0])
			dual(1,9,4);
			dual(1,5,0);
			translate([-20,-20,1.5])
			cube([100,100,100]);
		}
		difference()
		{
			translate([0,0,-10])
			cube([18+1,70,4.8]);
			dual(0,5,0.5);
		}	
	}
	translate([-4.5,0,-9])
	clip();
	translate([-4.5+18,0,-9])
	clip();
	rotate(180,[0,0,1])
	{
		translate([-4.5,-70,-9])
		clip();
		translate([-4.5-18,-70,-9])
		clip();
	}
}

module clip()
{
	cube([9,2,20]);
	translate([0,0,19.5])
	cube([9,5,4]);
}

module top()
{
	difference()
	{
		translate([0,-2,0])
		dual(1,9,4);
		dual(1,5,0);
		translate([-20,-20,-100])
		cube([100,100,100]);

		translate([-2,0,0])
		cube([27,70,20]);

		//parts that need holes in here
		translate([-2,5.5,9])
		{
			translate([7,58.5,7.5-2.5])
			rotate(-90,[1,0,0])
			hull()
			{
				cylinder(7,d=5);
				translate([0,15])
				cylinder(7,d=5);
			}
			
			//button
			translate([7.3,0,3.4])
			rotate(90,[1,0,0])
			cylinder(10,d=4.4);

			translate([-10,13.3,0])
			cube([20,14.5,7.7]);
		
			translate([-10,38.5,0])
			cube([20,14.5,7.7]);
		}
	}

	translate([-2,-1,9])
	difference()
	{
		height=8.6+3+2; width=72+2; depth=27+2;
		translate([-1,-1,0.01])
		difference()
		{
			minkowski()
			{
				r=2;
				translate([r,r,r-2])
				cube([depth-2*r,width-2*r,height-2*r + 2]);
				sphere(r);
			}
			translate([3,2,-9])
			dual(1,5);
		}
		usb_charger();
	}
}

module button()
{

	translate([-2,5,9])
	translate([7.3,0,3.4])
	rotate(90,[1,0,0])
	cylinder(9,d=4.2);

	difference()
	{
		translate([-2,0,7])
		cube([15,3.5,14]);
		union()
		{
			difference()
			{
				top();
				translate([-100,-1000,0])
				cube(1000);
			}
			dual();
		}
	}
}