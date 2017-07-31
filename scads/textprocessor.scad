txt="abc";



module advtext(message, size=10)
{
	for (i = [0:len(message)])
	{
		translate([i*10,0,0])
		minkowski()
		{
			linear_extrude(1)
			{

				offset(-0.2)
					text(message[i]);
			}
			sphere(0.4);
		}
		translate([i*10,12,0])
		minkowski()
		{
				text(message[i]);
		}
	}
}