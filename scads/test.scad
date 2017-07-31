// Reverse Slicer 
// build a complex shape from user definable functions 
// as a faster alternative to multiple unions 


// Start user definable data

$fn=10; 

Slices=100;

// angle by which each slice is tilted, currently not implemented 
SliceAngle=[for(i=[0:1:Slices-1]) [3.6*i,0,0]];

// position of each slice relative to origin 
SlicePosition=[for(i=[1:1:Slices]) [0,0,(i-1)/50]];

SliceRadius=[for(i=[1:1:Slices]) 10/pow(i,.3)]; 

// returns a list of vertices, called a slice, centered around the origin, by which a circle of radius r and height 0 will be approximated 
function CircularSlice(r=1)=[let(Step=360/$fn) for(i=[0:1:$fn-1]) [r*cos(i*Step),r*sin(i*Step),0]];

// End user definable data 


// Start generating list 

// list of all slices needed to construct shape 
Offset_X=flatten([
	for(i=[0:1:Slices-1])
		MinElement_X(CircularSlice(SliceRadius[i]))
]);

// list of all slices needed to construct shape 
VertexList=flatten([
	for(i=[0:1:Slices-1])
		MoveSlice(CircularSlice(SliceRadius[i]),SlicePosition[i])
]);

// list of all triangular faces needed to close shape at one end 
EndFace1=[for(i=[2:1:$fn-1]) [0,i-1,i]];

// list of all triangular faces needed to close shape at other end 
EndFace2=[let(F=(Slices-1)*$fn) for(i=[F:1:F+$fn-3]) [F,i+2,i+1]];

SideFaces=flatten([
	for(i=[0:1:$fn-1])
		for(k=[0:1:Slices])
			[
				[i+k*$fn, (i+$fn)+k*$fn, ((i+1)%$fn)+k*$fn],
				[((i+1)%$fn)+k*$fn, (i+$fn)+k*$fn, ((i+1)%$fn+$fn)+k*$fn]
			]
]);

FacesList=concat(EndFace1,SideFaces,EndFace2); 

// Element of slice farthest out on negative y axis, defines distance of tilting (rotation) axis from x axis 
function MinElement_X(Sl,A)=min([for(i=[0:1:$fn-1]) let (m=ExtractSlice(Sl,i)) m[1]]);

function flatten(l)=[for (a=l) for (b=a) b] ;

// extract a vector from a slice 
function ExtractSlice(List,Element)=flatten([for(i=Element) List[i]]);

// move slice to [x,y,z]
function MoveSlice(Sl,SP)=[for(i=[0:1:$fn-1]) let (v=ExtractSlice(Sl,i)) [v[0]+SP[0], v[1]+SP[1], v[2]+SP[2]]];

// end generating list

// generate shape from list
difference() {   // test for CSG compatibility 
polyhedron(VertexList,FacesList); 
cylinder(h=1000,r=1);} 