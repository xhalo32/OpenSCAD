r=1;
R=4;

range=[-180,180];
stept=2;
stepp=1;

function x(theta,phi) = (R+r*cos(theta))*cos(phi);
function y(theta,phi) = (R+r*cos(theta))*sin(phi);
function z(theta,phi) = r*(sin(theta));

mathtower();

module mathtower()
{

	difference()
	{
		union()
		{
			rotate_extrude()
			{
				translate([R,0])
					circle(d=2, $fn=10);
			}
			for (i = [range[0]:stept:range[1]])
			{
				for (j = [range[0]:stepp:range[1]])
				{
					k = j+3.141*sin(4*j);
					//color([i/360+1/2,j/360+1/2,0])
					translate([x(i,k), y(i,k), z(i,k)])
						cube(1.1, center=true);
				}
			}
		}
	}
}
