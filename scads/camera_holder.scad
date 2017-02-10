plate_height=2.0;

clamp_width=35;
clamp_depth=20;
clamp_height=4;

holder_depth=41;
holder_height=12;
holder_delta=5;

leg_height=35;
leg_depth=10;

table_depth=25;
table_height=5;


module clamp()
{
    difference()
    {
        cube([clamp_width, clamp_depth, 2*clamp_height+plate_height]);
        #translate([-100+clamp_width/2,0,clamp_height])
            cube([200,200,plate_height]);
    }

}

module eye_base()
{
    difference()
    {
        cylinder(d=52, h=6);
        translate([-26,26*cos(asin(41.5/52)),0])
            cube([52,52,6]); 
    }
    
}


module holder()
{
    translate([0,0,holder_height/2-clamp_height-plate_height/2])
    {
        translate([0,holder_depth,0])
            clamp();
        cube([clamp_width, holder_depth, 2*clamp_height+plate_height]);
    }
    cube([clamp_width, holder_depth-holder_delta, holder_height]);
    
    translate([0,holder_depth-holder_delta,holder_height])
        rotate(-90-30,[1,0,0])
            cube([clamp_width,3,5]);
    translate([0,holder_depth-holder_delta,0])
        rotate(+90-60,[1,0,0])
            cube([clamp_width,5,3]);
    
    translate([0,0,holder_height])
        cube([clamp_width, leg_depth, leg_height]);
    translate([0,-table_depth/2+leg_depth/2,holder_height+leg_height])
        cube([clamp_width, table_depth, table_height]);
}

holder();