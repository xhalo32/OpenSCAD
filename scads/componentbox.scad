matrix=
[
	[1,1,1,1],
	[1,1,1,1],
	[2,2],
];

h=20;
w=30;

box_height=15;
box_layer=2;
box_wall=1;

box_size=[sumvec(matrix[0],len(matrix[0])), len(matrix)];


function sumvec(vector, index, sum=0) = 
	index == 0 ? 
		sum : 
		sumvec(vector, index-1, sum+vector[index-1]); // sums index amount of values in vector 


for (i = [0:len(matrix)-1])
{
	if (sumvec(matrix[i],len(matrix[i])) != box_size[0]) echo(i,"Not valid!");
}


module componentbox()
{
	difference()
	{
		cube([box_size[0] * (w + box_wall) + box_wall, box_size[1] * (h + box_wall) + box_wall, box_height]);

		#translate([0,0,box_layer])
		for (i = [0:box_size[1]-1])
		{
			translate([0,(box_size[1]-1-i) * (h+box_wall) + box_wall,0])
			for (j = [0:len(matrix[i])-1])
			{
				translate([sumvec(matrix[i],j) * (w+box_wall) + box_wall,0,0])
					cube([w * matrix[i][j] + box_wall * (matrix[i][j]-1), h,box_height]);
			}
		}
	}
}


componentbox();