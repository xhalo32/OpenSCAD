width=75+0.5;
length=80+20;
depth=8;
size=4;
size2=6;

phonedock();

module phone()
{
	cube([length,width,depth]);
	translate([0,size/2,depth])
		cube([length,width-size,depth]);
}

module phonedock()
{
	difference()
	{
		union()
		{
			translate([0,width/2-size,-size])
				cube([width,2*size,size]);

			for (i = [0,1])
			{
				translate([(length-20-size2)*i,-size,-size])
				{
					cube([size2,width+2*size,depth+1.5*size]);

					rotate(-30,[1,0,0])
						cube([size2,(width+2*size)*sin(60),size]);

					translate([0,width+size/sin(60),size*cos(60)])
						rotate(-30-90,[1,0,0])
							cube([size2,(width+2*size)*tan(30)*sin(60),size]);
				}
			}
		}
		translate([-10,0,0])
			#phone();

		translate([-10,width+size,-width])
			#cube([length,width,2*width]);

		translate([-10,width+size,depth+size/2])
			rotate(45,[1,0,0])
				translate([0,-sin(45)*size/2,-width])
					#cube([length,width,2*width]);

		mirror([0,1,0])
		translate([-10,size,depth+size/2])
			rotate(45,[1,0,0])
				translate([0,-sin(45)*size/2,-width])
					#cube([length,width,2*width]);
	}
}
