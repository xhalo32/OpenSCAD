include <chess_pawn_new.scad>
include <chess_rook_new.scad>
include <chess_knight_new.scad>
include <chess_bishop_new.scad>
include <chess_king_new.scad>
include <chess_queen_new.scad>


function pos(file,rank)=[32*file-16, 32*rank-16];


for (i = [-1:2:1])
{
	color([
(i+1)/3+0.33,(i+1)/3+0.33,(i+1)/3+0.33])
	union()
	{
		translate(pos(1,4.5-3.5*i))
		rook();
		translate(pos(2,4.5-3.5*i))
		knight();
		translate(pos(3,4.5-3.5*i))
		bishop();
		translate(pos(4,4.5-3.5*i))
		queen();
		translate(pos(5,4.5-3.5*i))
		king();
		translate(pos(6,4.5-3.5*i))
		bishop();
		translate(pos(7,4.5-3.5*i))
		knight();
		translate(pos(8,4.5-3.5*i))
		rook();

		for (j = [1:8])
		{
			translate(pos(j,4.5-2.5*i))
			pawn();
		}	
	}	
}


module chessboard()
{
	for (file = [0:7])
	{
		for (rank = [0:7])
		{
			c = (file+rank) % 2;

			color([c,c,c,0.1])
			translate([32*file,32*rank,-5])
			cube([32,32,5]);
		}
	}
}