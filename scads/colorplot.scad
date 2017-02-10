for(i=[0:100]) {
	for(j=[0:100]) {
		/*color( [	0.5+sin(10*i)/2,
				0.5+sin(10*j)/2,
				0.5+sin(10*(i+j))/2] )
		*/
		color([
			0.5-f(i, j)/4,
			0.5+f(i, j)/4,
			0])

		if (j>0)
		{
			translate( [i, j, 0] )
			cube( [1, 1, 21+10*f(i, j)] );
		}
	}
}

function f(x, y) = sin(10*y)+cos(10*x);