matrix=
[
	[1,1,1],
	[1,1,1],
	[1,1,1],
];

carvings=
[
	[ "1k","10k","100k" ],
	[ "<1k","",">100k" ],
	[ "" ],
];

$fn=10;
h=25;
w=40;

box_height=12;
box_layer=2;
box_wall=1;

box_size=[sumvec(matrix[0],len(matrix[0])), len(matrix)];

text_size=0.4;

function sum(vector) =
	sumvec(vector, len(vector));

function sumvec(vector, index, sum=0) = 
	index == 0 ? 
		sum : 
		sumvec(vector, index-1, sum+vector[index-1]);
		// sums index amount of values in vector 

echo(sum([1,2,3,4,5,4,3,2,1]));


for (i = [0:len(matrix)-1]) // test for invalid matrix
{
	if (sumvec(matrix[i],len(matrix[i])) != box_size[0]) echo(i,"Not valid!");
}


module box()
{
	difference()
	{
		cube([box_size[0] * (w + box_wall) + box_wall,
			box_size[1] * (h + box_wall) + box_wall,
			box_height]);

		translate([0,0,box_layer])
		for (i = [0:box_size[1]-1])
		{
			translate([0,(box_size[1]-1-i) * (h+box_wall) + box_wall,0])
			for (j = [0:len(matrix[i])-1])
			{
				translate([sumvec(matrix[i],j) * (w+box_wall) + box_wall,0,0])
					cube([w * matrix[i][j] + box_wall * (matrix[i][j]-1),
						h, box_height]);

				// carvings
				#translate([sumvec(matrix[i],j)*(w+box_wall)+box_wall+ (w*matrix[i][j]+box_wall*(matrix[i][j]-1))/2,
					h/2,-box_layer/2])
					linear_extrude(box_layer)
						text(carvings[i][j], text_size*h, font="Courier", halign="center", valign="center");
				
			}
		}
	}
}


box();