$fn=60;
hole=5.4;
step=1/100; height=25; stepheight=1/3; threadr=1/3; rots=20;
use <utils.scad>;

!mount();
translate([0,0,10])
	!nut();

module thread(stepheight=stepheight,hole=hole,threadr=threadr)
{
	points=[for (a=[0:step:height-stepheight]) [
		[ (hole/2-threadr)*cos(a/height*360*rots),(hole/2-threadr)*sin(a/height*360*rots),a-stepheight ],
		[ (hole/2-threadr)*cos(a/height*360*rots),(hole/2-threadr)*sin(a/height*360*rots),a+step ],
		[ (hole/2)*cos(a/height*360*rots),(hole/2)*sin(a/height*360*rots),a+step ],
		[ (hole/2)*cos(a/height*360*rots),(hole/2)*sin(a/height*360*rots),a-stepheight ] ]
	];
	flatpoints=[ for (i=[0:len(points)-1]) for (j=[0:3]) points[i][j] ];

	_faces2=[for (i=[0:len(flatpoints)-5]) for (j=[0:1])
		[i,
		(i+1+(3+4*floor((i%4)/3))*j-4*floor((i%4)/3))*j + (i+5-4*floor((i%4)/3))*(1-j),
		(i+5-4*floor((i%4)/3))*j + (i+1+(3+4*floor((i%4)/3))*j-4*floor((i%4)/3))*(1-j)]];

	faces2=concat(_faces2, [[0,1,2]], [[0,2,3]],[[len(flatpoints)-1,len(flatpoints)-2,len(flatpoints)-3]], [[len(flatpoints)-1,len(flatpoints)-3,len(flatpoints)-4]]);

	polyhedron(flatpoints,faces2);
}
module mount()
{
	size=[30,20,1];

	roundcube(size,2);
	translate([size[0]/2,size[1]/2,size[2]])
	{
		cylinder(height,r=hole/2-threadr);
		thread();
	}
}

module nut()
{
	nuth=4; nutr=hole/2+2; stepheight=1/2; newthreadr=1/2;
	difference()
	{
		cylinder(h=nuth,r=nutr,$fn=6);
		cylinder(height+1,r=hole/2-threadr+0.15);
		thread(stepheight,hole+newthreadr*2-threadr*2,newthreadr+1);
	}
}



