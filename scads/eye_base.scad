$fn=60;


eye_base_cut=41.5;
eye_base_diameter=52;
eye_base_height=6; // minus plate height
plate_height=2;

eye_base_cut=26-26*cos(106/2);

// 2*eye_base_radius*sin(106/2) ~ 41.5
// 2*eye_base_radiu/41.5 ~ 1/sin(106/2)
// 41.5/2eye_base_radius ~ sin(106/2)
// asin(41.5/eye_base_diameter)*2 = angle

eye_base_cut=26-26*cos(asin(41.5/52));

echo(eye_base_cut);

module eye_base()
{
    difference()
    {
        cylinder(d=eye_base_diameter, h=eye_base_height);
        translate([-eye_base_diameter/2,eye_base_diameter/2-eye_base_cut,0])
            cube([eye_base_diameter,eye_base_diameter,eye_base_height]);


    }
}



difference()
{
    scale(1.1) rotate(180,[0,0,1]) eye_base();
    translate([0,0,plate_height])  rotate(180,[0,0,1]) eye_base();
}