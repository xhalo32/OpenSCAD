difference()
{
	stand();
	translate([0,0,10-4])
	#object();

	
	linear_extrude(1)
		scale(1)
		mirror([1,0,0])
		translate([-22.5,-6])
		#import("torusEquation.dxf");
}


// http://forum.openscad.org/An-HSV-HSB-to-RGB-Color-function-in-OpenSCAD-td9849.html
function hsv(h, s = 1, v = 1, a = 1, p, q, t) = (p == undef || q == undef || t == undef)
    ? hsv(
        (h%1) * 6,
        s<0?0:s>1?1:s,
        v<0?0:v>1?1:v,
        a,
        (v<0?0:v>1?1:v) * (1 - (s<0?0:s>1?1:s)),
        (v<0?0:v>1?1:v) * (1 - (s<0?0:s>1?1:s) * ((h%1)*6-floor((h%1)*6))),
        (v<0?0:v>1?1:v) * (1 - (s<0?0:s>1?1:s) * (1 - ((h%1)*6-floor((h%1)*6))))
    )
    :
    h < 1 ? [v,t,p,a] :
    h < 2 ? [q,v,p,a] :
    h < 3 ? [p,v,t,a] :
    h < 4 ? [p,q,v,a] :
    h < 5 ? [t,p,v,a] :
            [v,p,q,a];

module object()
{
	color("gray")
	scale(5)
	{
		translate([0,0,4*sin(36)+1 + 1.1/2*sqrt(2)*sin(36+45)])
			rotate(36,[1,0,0])
				scale(1.01)
					import("../stls/mathtower.stl");
	}
}

module stand()
{
	message="abcdefghijklmnopqrstuvwxyz";
	R=5*(4*cos(36)+1 + 1.1/2*sqrt(2)*sin(36+45));
	d=1;
	h=2;
	coef=10;

	cylinder(10,r=R, $fn=len(message));

	function f(x,y)=coef*(pow(5,-pow(x/10,2)) * 2.1*pow(2,-pow((y-R/2-2)/6,2)))+0.5;

	range=[0,R];
	astep=5;
	step=1;

	translate([0,0,10])
	for (a = [0:astep:360])
	{
		for (i = [range[0]:step:range[1]])
		{
			k=i*3.1416*i*astep/360;
			if (k < R)
			{
				color(hsv(a/360))
				translate([k*cos(a),k*sin(a)])
					cylinder(f(k*cos(a),k*sin(a)),r=3.1416*k*astep/360+1, $fn=10);
			}
		}
	}

}