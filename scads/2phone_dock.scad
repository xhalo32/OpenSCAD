phone_width = 80;		//mm
phone_depth = 25;
phone_height = 140;;
phone_padding = 10;
round_radius = phone_depth / 2;

stand_height = 55 + 10;		// 2 / 5
stand_width = phone_width + 20;
stand_length = 2 * phone_depth + 3 * phone_padding;

stand_angle = 20;

dock_width = stand_width+10;
dock_length = 120;
dock_height = 10;

text_from_left = 5;
text_extrusion = 2;

module phone()
{
	color("gold")
	{
		translate([0,round_radius,0])
			cube([phone_depth, phone_width-2*round_radius, phone_height]);

		translate([round_radius, round_radius, 0])
			cylinder(r =round_radius, h=phone_height);

		translate([round_radius, phone_width-round_radius, 0])
			cylinder(r =round_radius, h=phone_height);
	}
}


module phone_dock()
{
	difference()
	{
		union()
		{
			cube([dock_length, dock_width, dock_height]);
		
			translate([dock_length / 10, ( dock_width - stand_width ) / 2, dock_height])
		
			difference()
			{
				rotate(stand_angle, [0,1,0])
				translate([0,0,0])
				cube([stand_length, stand_width, stand_height]);
		
		
				translate([0,0,-50])
				cube([stand_length + 15, stand_width, 50]);
			}
		}
		#union()
		{
			translate([dock_length / 7 + phone_padding,(dock_width-stand_width)/2+phone_padding, dock_height + 10])
			{
				rotate(stand_angle, [0,1,0])
					phone();
				
				translate([phone_padding + phone_depth, 0, 0])
					rotate(stand_angle, [0,1,0])
						phone();
				
				rotate(stand_angle, [0,1,0])
				translate([-2, text_from_left-phone_padding, stand_height*cos(stand_angle) - dock_height-text_extrusion])
				scale([0.5,0.5,1])
				rotate(90,[0,0,1])
				name_stamp("Oliver");

				rotate(stand_angle, [0,1,0])
				translate([32, text_from_left-phone_padding, stand_height*cos(stand_angle) - dock_height-text_extrusion])
				scale([0.5,0.5,1])
				rotate(90,[0,0,1])
				name_stamp("Rebecca");
		
			}
		}
	}
}

module name_stamp( name )
{
	linear_extrude(text_extrusion)
	text(name, font = "Ubuntu Light:style=Italic");
}

phone_dock();











