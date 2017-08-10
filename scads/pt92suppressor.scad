inner=8.75;
outer=13.55;
height=7.5;

connector_inner=inner-1;
connector_outer=outer+2;
connector_height=20;

bb_d_actual = 6.8;
bb_d = 9.75;

m4_barrelend_inner = 14;
m4_barrelend_inner_cut = 13.5; 
m4_barrelend_length = 12.2;
m4_barrelend_thick = 2;

sup_barrelcap_info = [21.8, 6.4, 19];

sup_length=100;
sup_d = [25, 2];
sup_layer = 3;
sup_bround = 2;
sup_tround = 2;

baf_height = 12;
baf_thick = 3;
baf_delta = 14;
baf_num = 6;
baf_from_floor = baf_delta;

baf_totalheight = baf_num*baf_delta+baf_height-baf_delta;

csection=true;
csection=false;

$fn=100;

sup();

module barrel()
{
	difference()
	{
		cylinder(h=height,d=outer);
		cylinder(h=height,d=inner);
	}
}

module connector()
{
	difference()
	{
		difference()
		{
			cylinder(h=connector_height,d=connector_outer);
			cylinder(h=connector_height,d=connector_inner);
		}
		translate([0,0,connector_height-height])
			barrel();
	}
}

module sup_barrelcap()
{
	difference()
	{
		rotate_extrude()
		{
			hull()
			{
				translate([0,0.5,0])
					square(
[sup_barrelcap_info[0]/2, sup_barrelcap_info[1]-1.5]);
				square(
[sup_barrelcap_info[0]/2-1, sup_barrelcap_info[1]]);
			}
		}

		for (i = [0:1])
		{
			rotate(i*180,[0,0,1])
				translate(
[sup_barrelcap_info[2]/2, -sup_barrelcap_info[0]/2], 0)
					cube(
[sup_barrelcap_info[0],
sup_barrelcap_info[0],
sup_barrelcap_info[1]]);
		}
	}
}

module sup_barrelcon()
{
	difference()
	{
		cylinder(
m4_barrelend_length,d=m4_barrelend_inner);

		union()
		{
			cylinder(
	m4_barrelend_length,
	d=m4_barrelend_inner-2*m4_barrelend_thick);
			translate(
[-10,m4_barrelend_inner/2-m4_barrelend_inner_cut-10,0])
				cube([20, 10, m4_barrelend_length]);
		}
	}
}

module sup_main()
{
	difference()
	{
		//cylinder(sup_length,d=sup_d[0]);
		rotate_extrude()
		{
			square([sup_d[0]/2-sup_bround, sup_length]);
			translate([0,sup_bround])
			square([sup_d[0]/2, sup_length-2*sup_bround]);

			translate(
			[sup_d[0]/2-sup_bround, sup_bround])
				circle(sup_bround);

			translate(
			[sup_d[0]/2-sup_bround, sup_length-sup_bround])
				circle(sup_bround);
		}

		translate([0,0,sup_layer])
			cylinder(sup_length,d=sup_d[0]-2*sup_d[1]);

		cylinder(sup_layer,d=bb_d);
	}
	translate(
	[0,0,sup_length-baf_totalheight-baf_from_floor])
		sup_baffle_stack();
}

module sup_baffle()
{
	difference()
	{
		cylinder(
baf_height,d1=sup_d[0],d2=bb_d);


		translate([0,0,-baf_thick])
			cylinder(
	baf_height,d1=sup_d[0],d2=bb_d);

		cylinder(baf_height+1,d=bb_d);
	}
}

module sup_baffle_stack()
{
	for (i = [0:baf_num-1])
	{
		translate([0,0,baf_delta*i])
			sup_baffle();
	}
}

module sup_strength_baffle()
{
	difference()
	{
		rotate_extrude()
		{
			square([sup_d[0]/2-sup_tround, baf_height]);
			translate([0,sup_tround])
			square(
			[sup_d[0]/2, baf_height-2*sup_tround]);

			translate(
			[sup_d[0]/2-sup_tround, sup_tround])
				circle(sup_tround);

			translate(
		[sup_d[0]/2-sup_tround, baf_height-sup_tround])
				circle(sup_tround);
		}

		translate([0,0,-baf_thick])
			cylinder(
	baf_height,d1=sup_d[0],d2=bb_d);

		cylinder(baf_height+1,d=bb_d);
		
	}
}

module sup()
{
	difference()
	{
		union()
		{
			sup_main();
			
			translate([0,0,sup_length-baf_height])
				sup_strength_baffle();

			translate([0,0,sup_length])
				difference()
				{
					sup_barrelcap();
					cylinder(
			sup_barrelcap_info[1],d=bb_d);
				}
				
			translate([0,0,sup_length+sup_barrelcap_info[1]])
				connector();

		}
		if(csection == true)
		{
			translate([-50,-50,-1])
				cube([100,50,2*sup_length]);
			
		}
	}
}