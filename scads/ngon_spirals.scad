// STATIC VARIABLES

slices=200;
poly=5;
height=80;
twist=72;


// RENDERING

spiral(40);







// MODULES


module spiral( argd=20 )
{
	linear_extrude(height,twist=twist,slices=slices)

		difference()
		{
			offset(r=3,$fn=slices)			//	5	4	3
				circle(d=argd,$fn=poly);

			offset(r=2.6,$fn=slices)		//	4.6	3.6	2.6
				circle(d=argd,$fn=poly);
		}
}