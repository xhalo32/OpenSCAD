/*
 *  Black Nightmare puzzle box
 *
 *  Original Black Nightmare:  Bruce Viney, Homemade Puzzles, Jan., 2008
 *	http://homepage.ntlworld.com/bruce.viney/Black%20Nightmare%20Plans.pdf
 *  Black Nightmare 3D printer port: "ikilledkenny" (Don), Apr. 19, 2012.
 *	http://www.thingiverse.com/thing:21658
 *  Black Nightmare SCAD port:  Tim Edwards, OpenCircuitDesign, Feb. 25, 2013
 */

union()
{
   // Original is 72mm x 72mm, this one is scaled down to fit all pieces on
   // a single build platform.

   scale(0.6) {

   // Arrange all pieces on the build area

     puzzlebox_front();
     translate([70, 0, 0])
	puzzlebox_back();

     translate([110, 70, 0])
	puzzlebox_frontshortslider();
     translate([110, 100, 0])
	puzzlebox_frontlongslider();
     translate([150, 0, 0])
	puzzlebox_backshortslider();
     translate([150, 30, 0])
	puzzlebox_backlongslider();
     translate([165, 60, 0])
	puzzlebox_innertopsliderfront();
     translate([165, 80, 0])
	puzzlebox_innertopsliderback();
     translate([165, 100, 0])
	puzzlebox_innerbottomslider();
     translate([165, 120, 0])
	puzzlebox_innerbottomslider();

     translate([0, 140, 0])
	puzzlebox_panelcover();
     translate([0, 200, 0])
	puzzlebox_panelcover();
     translate([60, 140, 0])
	puzzlebox_panelcover();
     translate([60, 200, 0])
	puzzlebox_panelcover();
     translate([120, 140, 0])
	puzzlebox_bottompanel();
     translate([120, 215, 0])
	puzzlebox_bottominnerpanel();
     translate([225, 0, 0])
	puzzlebox_toppanel();
     translate([225, 80, 0])
	puzzlebox_topinnerpanel();
     translate([220, 140, 0])
	puzzlebox_leftpanel();
     translate([160, 270, 0])
	puzzlebox_leftinnerpanel();
     translate([0, 260, 0])
	puzzlebox_rightpanel();
     translate([80, 280, 0])
	puzzlebox_rightinnerpanel();
     translate([240, 220, 0])
	puzzlebox_middle_part1();
     translate([55, 70, 0])
	puzzlebox_middle_part2();
     translate([0, 70, 0])
	puzzlebox_middle_part3();
   }
}

//-------------------------------------------------------------------
// Principle paramaterized values
//-------------------------------------------------------------------

// Pinshort is the amount to cut from the normal 4mm pin length where the
// holes do not completely penetrate the next layer.  Allows for slight
// droop in the layer fill covering the hole.  Used only on the panel
// cover.
pinshort = 0.5;

// "t" is the amount of clearance needed beyond the exact measurements,
// to account for manufacturing tolerance.
t = 0.2;

// "e" is the amount of extra clearance needed beyond the manufacturing
// tolerance to let the pieces slide easily along the tracks
e = 0.15;

// Set pin radius to 2mm.
pinrad = 2.0;

// For holes that face the build platform, the holes tend to pinch up
// and so need a larger value.  A multiplier of 1.1 increases the hole
// size by 10%.

base_hole_mult = 1.1;

//-------------------------------------------------------------------

// Set hole radius.  Calculated from pin radius and manufacturing tolerance.
// All pin and holes radii are scaled up by 10;  this gives a better circle
// approximation;  the circle is then scaled back down using scale() {}.


rpin = (pinrad * 10);
rhole = (rpin + t * 10);	// Use manufaturing tolerance only for
				// pin-to-hole tight fit

r2hole = rhole * base_hole_mult;

d = t + e;
d2 = d * 2;

module puzzlebox_front()
{
   // Left side---generate rectangles around the cut-out area
   linear_extrude(height=4, slices=2)
	polygon( points=[[0, 0], [0, 16], [64, 16], [64, 0]] );
   linear_extrude(height=4, slices=2)
	polygon( points=[[0, 16], [0, 48], [16-d, 48], [16-d, 16]] );
   linear_extrude(height=4, slices=2)
	polygon( points=[[48+d, 16], [48+d, 48], [64, 48], [64, 16]] );
   linear_extrude(height=4, slices=2)
	polygon( points=[[0, 48], [0, 64], [64, 64], [64, 48]] );
   linear_extrude(height=4, slices=2)
	polygon( points=[[16-d, 28], [16-d, 36], [48+d, 36], [48+d, 28]] );

   // Place the stops on top of the left side
   translate([0, 0, 4]) {
	linear_extrude(height=4, slices=2)
	    polygon( points=[[4+d, 0], [4+d, 4-d], [56-d, 4-d], [56-d, 0]] );
	linear_extrude(height=4, slices=2)
	    polygon( points=[[60+d, 0], [60+d, 56-d], [64, 56-d], [64, 0]] );
	linear_extrude(height=4, slices=2)
	    polygon( points=[[0, 12+d], [0, 40-d], [4-d, 40-d], [4-d, 12+d]] );
	linear_extrude(height=4, slices=2)
	    polygon( points=[[0, 44+d], [0, 60-d], [4-d, 60-d], [4-d, 44+d]] );
	linear_extrude(height=4, slices=2)
	    polygon( points=[[8+d, 60+d], [8+d, 64], [64, 64], [64, 60+d]] );
   }

   // Add pins for securing the box center

   translate([24, 32, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
   translate([40, 32, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
   translate([24, 52-d, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
   translate([40, 52-d, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
   translate([24, 12+d, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
   translate([40, 12+d, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
}
	
// The reverse of the front
module puzzlebox_back()
{
   // Left side---generate rectangles around the cut-out area
   linear_extrude(height=4, slices=2)
	polygon( points=[[0, 0], [64,0], [64, 16], [0, 16]] );
   linear_extrude(height=4, slices=2)
	polygon( points=[[0, 16], [16-d, 16], [16-d, 48], [0, 48]] );
   linear_extrude(height=4, slices=2)
	polygon( points=[[48+d, 16], [64, 16], [64, 48], [48+d, 48]] );
   linear_extrude(height=4, slices=2)
	polygon( points=[[0, 48], [64, 48], [64, 64], [0, 64]] );
   linear_extrude(height=4, slices=2)
	polygon( points=[[16-d, 28], [48+d, 28], [48+d, 36], [16-d, 36]] );

   // Place the stops on top of the left side
   translate([0, 0, 4]) {
	linear_extrude(height=4, slices=2)
	    polygon( points=[[60-d, 0], [8+d, 0], [8+d, 4-d], [60-d, 4-d]] );
	linear_extrude(height=4, slices=2)
	    polygon( points=[[4-d, 0], [0, 0], [0, 56-d], [4-d, 56-d]] );
	linear_extrude(height=4, slices=2)
	    polygon( points=[[64, 12+d], [60+d, 12+d], [60+d, 40-d], [64, 40-d]] );
	linear_extrude(height=4, slices=2)
	    polygon( points=[[64, 44+d], [60+d, 44+d], [60+d, 60-d], [64, 60-d]] );
	linear_extrude(height=4, slices=2)
	    polygon( points=[[56-d, 60+d], [0, 60+d], [0, 64], [56-d, 64]] );
   }

   // Add pins for securing the box center

   translate([24, 32, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
   translate([40, 32, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
   translate([24, 52-d, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
   translate([40, 52-d, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
   translate([24, 12+d, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
   translate([40, 12+d, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
}

// The box middle, redesigned in three parts with easy assembly,
// and no suspended parts.

module puzzlebox_middle_part1() {
   // Start with base and walls.  Outer wall supports the second section,
   // while inner wall keeps all sections aligned and in place

   // base

   difference() {
    linear_extrude(height=8, slices=2)
            polygon( points=[[0+d, 0], [0+d, 64], [48-d, 64], [48-d, 0]] );

    translate([0, 0, 4])
        linear_extrude(height=5, slices=2)
            polygon( points=[[6, 4+d], [6, 60-d], [42, 60-d], [42, 4+d]] );

   rotate([90, 0, 0])
      translate([32, 4+d, -66]) {
	 linear_extrude(height=6+2*d, slices=2)
	     scale(1/10)
	   	 circle(r=rhole);
      }
   rotate([90, 0, 0])
      translate([16, 4+d, -66]) {
	  linear_extrude(height=6+2*d, slices=2)
	     scale(1/10)
	   	circle(r=rhole);
      }

   rotate([90, 0, 0])
      translate([32, 4+d, -4-2*d]) {
	 linear_extrude(height=8, slices=2)
	     scale(1/10)
	   	 circle(r=rhole);
      }
   rotate([90, 0, 0])
      translate([16, 4+d, -4-2*d]) {
	  linear_extrude(height=8, slices=2)
	     scale(1/10)
	   	circle(r=rhole);
      }
   }

   // outer sides
   linear_extrude(height=20-d, slices=2)
	    polygon( points=[[0+d, 4+d], [0+d, 60-d], [6, 60-d], [6, 4+d]] );
   linear_extrude(height=20-d, slices=2)
	    polygon( points=[[42, 4+d], [42, 60-d], [48-d, 60-d], [48-d, 4+d]] );

   // inner sides
   translate([0, 0, 20-d]) {
   linear_extrude(height=28-d, slices=2)
	    polygon( points=[[3+d, 4+2*d], [3+d, 60-2*d], [6, 60-2*d], [6, 4+2*d]] );
   linear_extrude(height=28-d, slices=2)
	    polygon( points=[[42, 4+2*d], [42, 60-2*d], [45-d, 60-2*d], [45-d, 4+2*d]] );
   }
}

module puzzlebox_middle_part2() {

   linear_extrude(height=20-d, slices=2)
	    polygon( points=[[0+d, 4+d], [0+d, 60-d], [3-d, 60-d], [3-d, 4+d]] );
   linear_extrude(height=20-d, slices=2)
	    polygon( points=[[45+d, 4+d], [45+d, 60-d], [48-d, 60-d], [48-d, 4+d]] );
   
   difference() {
        linear_extrude(height=8, slices=2)
            polygon( points=[[0+d, 0], [0+d, 64], [48-d, 64], [48-d, 0]] );

      translate([0, 0, -1])
        linear_extrude(height=10, slices=2)
            polygon( points=[[3-d, 4+d], [3-d, 60-d], [45+d, 60-d], [45+d, 4+d]] );

   rotate([90, 0, 0])
      translate([32, 4+d, -66]) {
	 linear_extrude(height=70, slices=2)
	     scale(1/10)
	   	 circle(r=rhole);
      }
   rotate([90, 0, 0])
      translate([16, 4+d, -66]) {
	  linear_extrude(height=70, slices=2)
	     scale(1/10)
	   	circle(r=rhole);
      }
   }
}

module puzzlebox_middle_part3() {
   
   difference() {
      linear_extrude(height=8, slices=2)
            polygon( points=[[0+d, 0], [0+d, 64], [48-d, 64], [48-d, 0]] );

      translate([0, 0, -1])
        linear_extrude(height=10, slices=2)
            polygon( points=[[3-d, 4+d], [3-d, 60-d], [45+d, 60-d], [45+d, 4+d]] );

   rotate([90, 0, 0])
      translate([32, 4+d, -66]) {
	 linear_extrude(height=70, slices=2)
	     scale(1/10)
	   	 circle(r=rhole);
      }
   rotate([90, 0, 0])
      translate([16, 4+d, -66]) {
	  linear_extrude(height=70, slices=2)
	     scale(1/10)
	   	circle(r=rhole);
      }
   }
}


// Sliders

module puzzlebox_frontshortslider() {
   linear_extrude(height=4, slices=2)
	polygon( points=[[0, 0+d], [0, 24], [48, 24], [48, 0+d]] );
   translate([8, 4, 4]) {
      linear_extrude(height=4+d, slices=2)
	    polygon( points=[[0+d, 0+d], [0+d, 12-d], [24-d, 12-d], [24-d, 0+d]] );
      translate([6, 6, 4+d]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([18, 6, 4+d]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
   }
}

module puzzlebox_frontlongslider() {
   linear_extrude(height=4, slices=2)
	polygon( points=[[0, 0], [0, 24-d], [48, 24-d], [48, 0]] );
   translate([8, 8, 4]) {
      linear_extrude(height=4+d, slices=2)
	    polygon( points=[[0+d, 0+d], [0+d, 12-d], [28-d, 12-d], [28-d, 0+d]] );
      translate([8, 6, 4+d]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([20, 6, 4+d]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
   }
}

module puzzlebox_backshortslider() {
   linear_extrude(height=4, slices=2)
	polygon( points=[[0, 0+d], [0, 24], [48, 24], [48, 0+d]] );
   translate([16, 4, 4]) {
      linear_extrude(height=4+d, slices=2)
	    polygon( points=[[0+d, 0+d], [0+d, 12-d], [24-d, 12-d], [24-d, 0+d]] );
      translate([6, 6, 4+d]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([18, 6, 4+d]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
   }
}

module puzzlebox_backlongslider() {
   linear_extrude(height=4, slices=2)
	polygon( points=[[0, 0], [0, 24-d], [48, 24-d], [48, 0]] );
   translate([12, 8, 4]) {
      linear_extrude(height=4+d, slices=2)
	    polygon( points=[[0+d, 0+d], [0+d, 12-d], [28-d, 12-d], [28-d, 0+d]] );
      translate([8, 6, 4+d]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([20, 6, 4+d]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
   }
}

module puzzlebox_innertopsliderback() {
   difference() {
      linear_extrude(height=4, slices=2)
	  polygon( points=[[4+d, 0+d], [4+d, 12-d], [48-d, 12-d], [48-d, 0+d]] );
      translate([22, 6, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([34, 6, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
   }
   linear_extrude(height=4, slices=2)
	polygon( points=[[0+d, 4+d], [0+d, 8-d], [4+d, 8-d], [4+d, 4+d]] );
   linear_extrude(height=4, slices=2)
	polygon( points=[[48-d, 8+d], [48-d, 12-d], [52, 12-d], [52, 8+d]] );
}

module puzzlebox_innertopsliderfront() {
   difference() {
      linear_extrude(height=4, slices=2)
	  polygon( points=[[4+d, 0+d], [4+d, 12-d], [48-d, 12-d], [48-d, 0+d]] );
      translate([22, 6, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([34, 6, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
   }
   linear_extrude(height=4, slices=2)
	polygon( points=[[0+d, 4+d], [0+d, 8-d], [4+d, 8-d], [4+d, 4+d]] );
   linear_extrude(height=4, slices=2)
	polygon( points=[[48-d, 0+d], [48-d, 4-d], [52, 4-d], [52, 0+d]] );
}

module puzzlebox_innerbottomslider() {
   difference() {
      linear_extrude(height=4, slices=2)
	  polygon( points=[[4+d, 0+d], [4+d, 12-d], [48-d, 12-d], [48-d, 0+d]] );
      translate([20, 6, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([32, 6, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
   }
   linear_extrude(height=4, slices=2)
	polygon( points=[[0+d, 4+d], [0+d, 8-d], [4+d, 8-d], [4+d, 4+d]] );
   linear_extrude(height=4, slices=2)
	polygon( points=[[48-d, 4+d], [48-d, 8-d], [52, 8-d], [52, 4+d]] );
}

// Panels


// Cover, with four pins to secure it to the main panel below
module puzzlebox_panelcover() {
   linear_extrude(height=4, slices=2)
	polygon( points=[[0, 0], [0, 48], [48, 48], [48, 0]] );
   translate([16, 16, 4]) {
	linear_extrude(height=4 - pinshort, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
   translate([32, 32, 4]) {
	linear_extrude(height=4 - pinshort, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
   translate([16, 32, 4]) {
	linear_extrude(height=4 - pinshort, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
   translate([32, 16, 4]) {
	linear_extrude(height=4 - pinshort, slices=2)
	    scale(1/10)
		circle(r=rpin);
   }
}

// Bottom panel
module puzzlebox_bottompanel() {
   
   // Create the panel and cut out four holes for panel cover pins
   difference() {
      linear_extrude(height=4, slices=2)
	   polygon( points=[[0, 0], [0, 64-d], [72, 64-d], [72, 0]] );
      translate([28, 24, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([28, 40, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([44, 40, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([44, 24, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
   }
   // Next panel up
   translate([8, 4, 4]) {
      linear_extrude(height=4+d, slices=2)
	   polygon( points=[[0+d, 0+d], [0+d, 56-d], [56-d, 56-d], [56-d, 0+d]] );
      // Place more pins for the inner panel to attach
      translate([20, 20, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([36, 20, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([36, 36, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([20, 36, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
   }
}

module puzzlebox_bottominnerpanel() {
   difference() {
      linear_extrude(height=4-d, slices=2)
	 polygon( points=[[0+d, 0+d], [0+d, 48-d], [64-d, 48-d], [64-d, 0+d]] );
      translate([24, 16, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([24, 32, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([40, 32, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([40, 16, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
   }
}

// Top panel
module puzzlebox_toppanel() {
   
   // Create the panel and cut out four holes for panel cover pins
   difference() {
      linear_extrude(height=4, slices=2)
	   polygon( points=[[0, 0], [0, 64-d], [72, 64-d], [72, 0]] );
      translate([28, 24, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([28, 40, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([44, 40, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([44, 24, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
   }
   // Overhanging lip
   translate([0, 0, 4]) {
      linear_extrude(height=4-d2, slices=2)
	   polygon( points=[[8+d, 60+d], [8+d, 64-d], [64-d, 64-d], [64-d, 60+d]] );
   }

   // Next panel up
   translate([8, 4, 4]) {
      linear_extrude(height=4+d, slices=2)
	   polygon( points=[[0+d, 0+d], [0+d, 52-d], [56-d, 52-d], [56-d, 0+d]] );
      // Place more pins for the inner panel to attach
      translate([20, 18, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([36, 18, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([36, 34, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([20, 34, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
   }
}

module puzzlebox_topinnerpanel() {
   difference() {
      linear_extrude(height=4-d, slices=2)
	 polygon( points=[[0+d, 0+d], [0+d, 52-d], [64-d, 52-d], [64-d, 0+d]] );
      translate([24, 18, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([24, 34, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([40, 34, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([40, 18, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
   }
}

// Left panel
module puzzlebox_leftpanel() {
   
   // Create the panel and cut out four holes for panel cover pins
   difference() {
      linear_extrude(height=4, slices=2)
	   polygon( points=[[0, 0], [0, 72], [72, 72], [72, 0]] );
      translate([28, 28, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([28, 44, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([44, 44, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([44, 28, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
   }

   // Next panel up
   translate([8, 4, 4]) {
      linear_extrude(height=4+d, slices=2)
	   polygon( points=[[0+d, 0+d], [0+d, 52-d], [56-d, 52-d], [56-d, 0+d]] );
      // Place more pins for the inner panel to attach
      translate([20, 18, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([36, 18, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([36, 34, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([20, 34, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
   }
}

module puzzlebox_leftinnerpanel() {
   linear_extrude(height=4-d, slices=2)
       polygon( points=[[0+d, 0+d], [0+d, 8-d], [4+d, 8-d], [4+d, 0+d]] );
   linear_extrude(height=4, slices=2)
       polygon( points=[[0+d, 12+d], [0+d, 16-d], [4+d, 16-d], [4+d, 12+d]] );
   linear_extrude(height=4, slices=2)
       polygon( points=[[0+d, 20+d], [0+d, 32-d], [4+d, 32-d], [4+d, 20+d]] );
   linear_extrude(height=4, slices=2)
       polygon( points=[[0+d, 44+d], [0+d, 52-d], [4+d, 52-d], [4+d, 44+d]] );

   linear_extrude(height=4, slices=2)
       polygon( points=[[60-d, 0+d], [60-d, 8-d], [64-d, 8-d], [64-d, 0+d]] );
   linear_extrude(height=4, slices=2)
       polygon( points=[[60-d, 12+d], [60-d, 16-d], [64-d, 16-d], [64-d, 12+d]] );
   linear_extrude(height=4, slices=2)
       polygon( points=[[60-d, 20+d], [60-d, 32-d], [64-d, 32-d], [64-d, 20+d]] );
   linear_extrude(height=4, slices=2)
       polygon( points=[[60-d, 44+d], [60-d, 52-d], [64-d, 52-d], [64-d, 44+d]] );

   // On the left panel, the inner panel is offset from the panel
   // below it, so pin holes are not centered, but offset in Y by ? (0?)

   difference() {
      linear_extrude(height=4, slices=2)
	 polygon( points=[[4+d, 0+d], [4+d, 52-d], [60-d, 52-d], [60-d, 0+d]] );
      translate([24, 14, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([24, 30, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([40, 30, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([40, 14, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
   }
}

// Right panel
module puzzlebox_rightpanel() {
   
   // Create the panel and cut out four holes for panel cover pins
   difference() {
      linear_extrude(height=4, slices=2)
	   polygon( points=[[0, 0], [0, 72], [72, 72], [72, 0]] );
      translate([28, 28, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([28, 44, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([44, 44, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([44, 28, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
   }

   // Next panel up
   translate([8, 4, 4]) {
      linear_extrude(height=4+d, slices=2)
	   polygon( points=[[0+d, 0+d], [0+d, 64-d], [56-d, 64-d], [56-d, 0+d]] );
      // Place more pins for the inner panel to attach
      translate([20, 24, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([36, 24, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([36, 40, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
      translate([20, 40, 4]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=rpin);
      }
   }
   // Overhanging lip
   translate([8, 8, 8]) {
      linear_extrude(height=4-d2, slices=2)
	   polygon( points=[[0+d, 0+d], [0+d, 4-d], [56-d, 4-d], [56-d, 0+d]] );
   }
}

module puzzlebox_rightinnerpanel() {
   linear_extrude(height=4-d, slices=2)
       polygon( points=[[0+d, 0+d], [0+d, 4-d], [4+d, 4-d], [4+d, 0+d]] );
   linear_extrude(height=4, slices=2)
       polygon( points=[[0+d, 12+d], [0+d, 16-d], [4+d, 16-d], [4+d, 12+d]] );
   linear_extrude(height=4, slices=2)
       polygon( points=[[0+d, 20+d], [0+d, 24-d], [4+d, 24-d], [4+d, 20+d]] );
   linear_extrude(height=4, slices=2)
       polygon( points=[[0+d, 36+d], [0+d, 40-d], [4+d, 40-d], [4+d, 36+d]] );

   linear_extrude(height=4, slices=2)
       polygon( points=[[60-d, 0+d], [60-d, 4-d], [64-d, 4-d], [64-d, 0+d]] );
   linear_extrude(height=4, slices=2)
       polygon( points=[[60-d, 12+d], [60-d, 16-d], [64-d, 16-d], [64-d, 12+d]] );
   linear_extrude(height=4, slices=2)
       polygon( points=[[60-d, 20+d], [60-d, 24-d], [64-d, 24-d], [64-d, 20+d]] );
   linear_extrude(height=4, slices=2)
       polygon( points=[[60-d, 36+d], [60-d, 40-d], [64-d, 40-d], [64-d, 36+d]] );

   // On the right panel, the inner panel is offset from the panel
   // below it, so pin holes are not centered, but offset in Y by 4

   difference() {
      linear_extrude(height=4, slices=2)
	 polygon( points=[[4+d, 0+d], [4+d, 40-d], [60-d, 40-d], [60-d, 0+d]] );
      translate([24, 8, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([24, 24, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([40, 24, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
      translate([40, 8, 0]) {
	 linear_extrude(height=4, slices=2)
	    scale(1/10)
		circle(r=r2hole);
      }
   }
}
