r=1;
R=4;

range=[-180,180];
step=10;

function x(theta,phi) = (R+r*cos(theta))*cos(phi);
function y(theta,phi) = (R+r*cos(theta))*sin(phi);
function z(theta,phi) = r*sin(theta);

for (i = [range[0]:step:range[1]])
{
	for (j = [range[0]:step:range[1]])
	{
		translate([x(i,j), y(i,j), z(i,j)])
			cube(1);	
	}
}
