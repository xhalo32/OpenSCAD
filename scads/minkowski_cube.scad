$fn = 48;


module rcube( xyz, radius )
{
	echo(xyz[0]/(xyz[0]/2+radius));

	scale([xyz[0]/(xyz[0]+2*radius) ,xyz[1]/(xyz[1]+2*radius), xyz[2]/(xyz[2]+2*radius)])
	minkowski()
	{
		cube([xyz[0],xyz[1],xyz[2]], center=true);
		sphere(r=radius);
	}

}


rcube([10,10,10],2);