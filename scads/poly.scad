a=30;
b=20;
c=10;	//half-axes of ellipse 
R=40;
r=10;
deltax=-90; deltay=-90;
max=360;


Step=10; 

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


function P(u,v)=[
	100*cos(v)*cos(u),
	100*cos(v)*sin(u),
	100*sin(v),
	];


// paraboloid
/*	v*cos(u),
	v*sin(u),
	v*v/100,*/

function SurfaceElement(u,v) = let(hs = Step / 2) [ P(u - hs, v - hs), 
													P(u + hs, v - hs), 
													P(u + hs, v + hs), 
													P(u - hs, v + hs)]; 

function quad(i) = let(p = i * 4) [[p, p + 1, p + 2], [p, p + 2, p + 3]]; 

function flatten(l) = [ for (a = l) for (b = a) b ] ; 
	
vertices=flatten([let(s = Step / 2) for(v = [s+deltay : Step : max - s+deltay]) for(u = [s+deltax : Step: max - s+deltax]) SurfaceElement(u, v)]); 
faces=flatten([for(v = [0 : max / Step - 1]) for(u = [0 : 2*max / Step - 1]) quad(v * max / Step + u) ]); 

*polyhedron(vertices, faces);


//surface
for (i = [0:4:len(vertices)/2-1])
{
	color(hsv(i/len(vertices)*2))
	polyhedron([ for (j=[0:3]) vertices[i+j] ], [[0,1,2,3]]);
}

// bottom
for (i = [1:2:141])
{
	color(hsv(i/len(vertices)*2))
	polyhedron([ for (j=[0:2]) vertices[i+j] ], [[0,1,2]]);
}

//top
for (i = [len(vertices)/2-146:2:len(vertices)/2])
{
	color(hsv(i/len(vertices)*2))
	polyhedron([ for (j=[0:2]) vertices[i+j] ], [[0,1,2]]);
}