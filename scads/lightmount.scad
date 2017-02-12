screw_depth=8;
screw_hole=3.2;

mount_diameter=5.5;
mount_height=10;

wire_diameter=4;

wire_distance_width=6;
wire_distance_depth=1.4;

hole_distance_width=7;
hole_distance_depth=8.5;

light_diameter=17.2;
inner_light_diameter=14;
inner_light_diameter=14.5;
inner_light_height=5.2;
inner_light_height=5.5;
inner_light_depth=9.5;
inner_light_depth=9.5;

screw_hole_offset = 0.5;

screw_cap = [5.5, 3];

$fn=32;

module mount();
{
	difference()
	{
		union()
		{
			difference()
			{
				union()
				{
					cylinder(d=light_diameter, h=mount_height);
					translate([0,-light_diameter/2,0])
						cube([light_diameter/2,light_diameter,mount_height]);
				}
				
				
				translate([0,0,mount_height-inner_light_height])
				intersection()
				{
					cylinder(d=inner_light_diameter, h=inner_light_height+1);
					translate([-inner_light_depth/2,-inner_light_diameter/2,0])
						cube([inner_light_depth,inner_light_diameter,mount_height]);
					
				}
			}
			translate(
		[-hole_distance_depth/2,-hole_distance_width/2,mount_height-screw_depth])
				cylinder(d=mount_diameter, h=screw_depth);
			translate(
		[hole_distance_depth/2,hole_distance_width/2,mount_height-screw_depth])
				cylinder(d=mount_diameter, h=screw_depth);

			difference() {
				translate([light_diameter/2,0,0])
				cylinder(d=light_diameter, h=mount_height / 2);
				translate([0,-light_diameter/2,0])
				cube([light_diameter/2,light_diameter,mount_height / 2]);
			}
			
		}
		
		#union()
		{
			translate(
			[-hole_distance_depth/2,-hole_distance_width/2,mount_height-screw_depth])
				cylinder(d=screw_hole, h=screw_depth);
			
			translate(
			[hole_distance_depth/2,hole_distance_width/2,mount_height-screw_depth])
				cylinder(d=screw_hole, h=screw_depth);
			
			translate([wire_distance_depth/2,-wire_distance_width/2,0])
				cylinder(d=wire_diameter,h=mount_height-inner_light_height+0.01);
			translate([-wire_distance_depth/2,wire_distance_width/2,0])
				cylinder(d=wire_diameter,h=mount_height-inner_light_height+0.01);
			translate([(3/4)*light_diameter - screw_hole_offset, 0, 0]) {
				cylinder(d=screw_hole, mount_height / 2);
				translate([0, 0, mount_height / 2 - screw_cap[1]])
					cylinder(d=screw_cap[0], h=screw_cap[1]);
			}
		}
		
	}
	
}



mount();