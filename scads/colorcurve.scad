
amp = 40;
dist = 100;

function curve(x) = pow(2, -(1/dist)*x*x) * amp;

for(x=[-50:.5:50])
{
	translate( [x, curve(x), 0] ) 
	color( 
	[ ( curve(x) )/curve(0),
	( curve(0)-curve(x) )/curve(0),
	0 ] ) cube(1);

}