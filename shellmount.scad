inner=6;
outer=20;
screwhole=5 + 0.15;
height=4;

stock=5;
stockheight=4;

module mount(length=30, holes=1)
{
    difference()
    {
        cube([outer,length,height]);
        
        union()
        {
            for(i=[1:holes])
            {
                translate([outer/2,i*length/(holes+1)])
                    cylinder(d=screwhole,h=height,$fn=30);
            }
            
        }
    }
    
    translate([outer/2-inner/2,length-stock,height])
        cube([inner,stock,stockheight]);
    
    translate([outer/2-inner/2,0,height])
        cube([inner,stock,stockheight]);
    
}



mount();