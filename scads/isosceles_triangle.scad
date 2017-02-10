angle = 98.46095072889200849886037758551538;
angle = 150;


length = 50;
height = 10;
fix=1;

echo(2*(length/cos(angle/2))*sin(angle/2));
width=2*(length/cos(angle/2))*sin(angle/2);

difference()
{
	cube([width,length,height]);
	
	#translate([width/2,50,-fix/2])
	rotate(270+angle/2, [0,0,1])
	cube([length/cos(angle/2),length*sin(angle/2),height + fix]);

	#translate([width/2,50,-fix/2])
	rotate(180-angle/2, [0,0,1])
	cube([length*sin(angle/2),length/cos(angle/2),height + fix]);

}