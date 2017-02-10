module rpi_case()
{
	import(
	"/home/toor/Desktop/3D/RPi_Case/rpi2-top_RASPBERRY_NH_netfabb.stl"
	);
}

difference()
{
	rpi_case();
	translate([50, 15, -40]) cylinder(r=5, h=30);
}