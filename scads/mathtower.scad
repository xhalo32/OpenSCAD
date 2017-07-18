range = 100;
rangex = [-range, range];
rangey = [-range, range];
step = .92;
baseheight=10;

radius = 30;
_height = 150;

height = pow(_height,2)/(_height*radius/2-_height);

function tower2(x, y) = height*radius/(sqrt(pow(x,2)+pow(y,2))+2) - height;
function atower2(z) = 1/((z + height) / (height*radius))-2;

translate([0,0,baseheight])
	difference()
	{
		for (i = [rangex[0]:step:rangex[1]])
		{
			for (j = [rangex[0]:step:rangex[1]])
			{
				translate([i,j,0])
					cylinder(h=tower2(i,j), r=step, $fn=10);
			}
		}
		difference()
		{
			cylinder(baseheight+_height,r=atower2(0)+step);
			cylinder(baseheight+_height,r=atower2(0));
		}
	}

difference()
{
	cylinder(baseheight,r=atower2(0), $fn=100);

	mirror([1,0,0])
		linear_extrude(1)
		text("1/(sqrt(pow(x,2)+pow(y,2))+2)", 2.4, "Arial bold", halign="center", valign="center");
}