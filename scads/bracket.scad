$fn = 30;


module plate(w) 
{
	
	difference()
	{
		cube( [ w[0], w[1], w[2] ] );
		translate([
			w[0]/2,
			w[1]/2,
			0 ]) 
		scale([  w[0], w[1], w[2] ] )cylinder( r=1/8,  h=1);
	}
}

module bracket(size)
{
	plate( size );
	translate([ 0,0,size[2] ]) rotate(90, [1,0,0]) plate( size );
	translate([ 0,-size[2],0 ]) cube( [ size[0], size[2], size[2] ] );
}


bracket([5, 5, 2]);