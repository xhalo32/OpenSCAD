$fn=100;
use <utils.scad>;

intersection()
{
	union()
	{
		//translate([1.7,0,5.2]) connector_top(false);
		connector_bot();
	}
	translate([80,-10,0])
		cube(40);
}

module connector_top(shell=true)
{
	height=11; flatheight=1; heightm=4.85; connheight=1.5;
	widthl=31.6+0.5; widthl2=56.8+0.5; widthm=25; widthm0=3.3; widthm1=18.4;
	widthm2s=13; widthm2e=22.5; widthr1=2; widthr=66.3;
	depth=8; radius=5;
	wall=1+.5; 2wall=2*wall;
	conndepth=3.7-0.3; connd=[24.8 +0.5,-1.3 -1]; conl=5; conw=17.5;
	widthtot=widthl+widthl2+widthm+widthm2e+widthr;

	difference()
	{
		union()
		{
			translate([0,0,-flatheight])
				cube([widthtot,depth+radius,flatheight]);
			/*	translate([widthl,0,0])
				roundcube1([widthl2,depth+radius,height],radius); */
			translate([widthl,0,0])
				difference()
				{
					roundcube1([widthm2e+widthl2+widthm,depth+radius,height],radius);
					translate([widthm2e+widthl2+widthm,depth+radius,0])
						rotate(-90-atan((widthm2e-widthm2s)/(depth+radius)),[0,0,1])
							cube([sqrt(pow(widthm2e-widthm2s,2)+pow(depth+radius,2)),100,height+0.1]);
				}
			translate([widthl+widthl2+widthm+widthm2s,0,0])
				difference()
				{
					cube([widthm2e-widthm2s,depth+radius,heightm]);
					translate([widthm2e-widthm2s,depth+radius,0])
						rotate(-90-atan((widthr1)/(depth+radius)),[0,0,1])
							cube([sqrt(pow(widthr1,2)+pow(depth+radius,2)),100,heightm+0.1]);
				}
			/* not necessary	for (i=[0,1])
			{
				translate([widthl+widthl2,0,0])
					translate([i*(widthm-widthm0),0,0])
						cube([widthm0,depth+radius,heightm]);
			}	*/
			translate([0,depth,0])
				roundcube1([widthtot,radius,height],radius);
		}
		// hole for connector
		//	translate([widthl+widthl2+widthm0,0,-flatheight])
		//		cube([widthm-2*widthm0,depth+radius,connheight]);
		translate([widthl+widthl2+connd[1]+conl,0,-flatheight])
			cube([conw,depth+radius,connheight]);

		// if object is made with wall thickness
		if(shell)
		{
			/*	translate([widthl+wall,wall,0])
				roundcube1([widthl2-2wall,depth+radius-wall,height-wall],radius); */
			translate([widthl+wall,wall,0])
				difference()
				{
					roundcube1([widthm2e-2wall+widthl2+widthm,depth+radius-wall,height-wall],radius);
					translate([widthm2e-2wall+widthl2+widthm,depth+radius,0])
						rotate(-90-atan((widthm2e-widthm2s)/(depth+radius)),[0,0,1])
							cube([sqrt(pow(widthm2e-widthm2s,2)+pow(depth+radius,2)),100,height+0.1]);
				}
			translate([widthl+widthl2+widthm+widthm2s-wall,wall,0])
				difference()
				{
					cube([widthm2e-widthm2s,depth+radius-wall,heightm-wall]);
					translate([widthm2e-widthm2s,depth+radius,0])
						rotate(-90-atan((widthr1)/(depth+radius)),[0,0,1])
							cube([sqrt(pow(widthr1,2)+pow(depth+radius,2)),100,heightm+0.1]);
				}
			/*	for (i=[0,1])
			{
				translate([widthl+widthl2-2wall,wall,0])
					translate([i*(widthm-widthm0+2wall+wall),0,0])
						cube([widthm0+wall,depth+radius,heightm-wall]);
			}	*/
			translate([wall,depth+wall,0])
				roundcube1([widthtot-2wall,radius-wall,height-wall],radius);
		}
	}
}

module connector_bot(shell=true)
{
	widthtot=203.2;
	widthd=1.9-0.2; width=widthtot+2*widthd; depth=48.5; brimdepth=1.3+0.2; brimheight=0.9;
	height=5.2;
	connheight=2.5; flatheight=1; top_depth=8; top_radius=5;
	conndepth=3.7-0.3; connd=[24.8 +0.5,-1.3 -1]; conl=5; conw=17.5; conhole=[3,1,1,connheight];
	widthl=31.6+0.5; widthl2=56.8+0.5; widthm=25; widthm0=3.3; widthm1=18.4;
	wall=1.5;
	mountholes=[[23.5,81,width-38.5],7,3.2];
	circuitboard=[[86,36],[12,2]];

	difference()
	{
		union()
		{
			cube([width,depth,height]);
			translate([widthd+widthl+widthl2+connd[1],-conndepth,0])
				cube([connd[0],conndepth,height-flatheight]);
			translate([0,-brimdepth,0])
				cube([width,brimdepth,brimheight],1.5);
			roundradius=1.5;
			translate([widthd+widthl+widthl2+connd[1],-conndepth-brimdepth,0])
				roundcube([connd[0],brimdepth+2*roundradius,brimheight],roundradius,$fn=30);
		}
		translate([0,0,height-flatheight])
			cube([width,top_depth+top_radius,flatheight]);
		translate([widthl+widthl2+connd[1]+widthd+conl,-conndepth,height-flatheight-connheight])
			cube([conw,top_depth+top_radius+conndepth+0.1,connheight]);
		for (i=[0:2])
		{
			translate([mountholes[0][i],0,brimheight])
				cube([mountholes[1],mountholes[2],height-flatheight-brimheight]);
		}
		for (i=[0:1])
		{
			translate([widthl+widthl2+connd[1]+widthd+conl-conhole[1]+i*(conw+conhole[1]),-conndepth+conhole[0],height-flatheight-connheight])
				cube([conhole[1],conhole[2],conhole[3]]);
		}

		if(shell)
		{
			translate([widthd+wall,top_depth+top_radius,wall])
				cube([width-2*(widthd+wall),depth-top_depth-top_radius,height-wall]);
		}
		// circuitboard
		translate([widthd+wall+widthl+widthl2+widthm0-circuitboard[0][1],mountholes[2]+circuitboard[1][1],wall])
			cube([circuitboard[0][0],top_radius+top_depth,height-wall]);
	}
}
