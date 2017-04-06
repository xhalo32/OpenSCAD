/*
 *  Black Nightmare puzzle box
 *
 *  Original Black Nightmare:  Bruce Viney, Homemade Puzzles, Jan., 2008
 *	http://homepage.ntlworld.com/bruce.viney/Black%20Nightmare%20Plans.pdf
 *  Black Nightmare 3D printer port: "ikilledkenny" (Don), Apr. 19, 2012.
 *	http://www.thingiverse.com/thing:21658
 *  Black Nightmare SCAD port:  Tim Edwards, OpenCircuitDesign, Feb. 25, 2013
 */

// This version of puzzle_box.scad contains bits and pieces
// to show the assembly process step by step.  Just change
// the lines to enable/disable the display of each section
// to work through step by step.  Just change "*" to "!" on
// the step to display, and reload in OpenSCAD.

// Step 1.  Display the three pieces of the middle part, separate
* union() {
     translate([0, 0, 0])
	puzzlebox_middle_part1();
     translate([0, 0, 60])
	puzzlebox_middle_part2();
     translate([0, 0, 100])
	puzzlebox_middle_part3();
}

// Step 2.  Display the three pieces of the middle part, together
* union() {
     translate([0, 0, 0])
	puzzlebox_middle_part1();
     translate([0, 0, 20-d])
	puzzlebox_middle_part2();
     translate([0, 0, 40-d2])
	puzzlebox_middle_part3();
}

// Step 3.  Show the break-out of the front side and sliders

* union() {
     translate([0, 0, 50])
        puzzlebox_front();
     translate([8, 32, 0])
	puzzlebox_frontshortslider();
     translate([8, 8, 0])
	puzzlebox_frontlongslider();
     translate([4, 40, 100])
	puzzlebox_innertopsliderfront();
     translate([4, 10, 100])
	puzzlebox_innerbottomslider();
}

// Step 4.  Show the completed front side

* union() {
     translate([0, 0, 4])
        puzzlebox_front();
     translate([8, 32, 0])
	puzzlebox_frontshortslider();
     translate([8, 8, 0])
	puzzlebox_frontlongslider();
     translate([0, 36, 8])
	puzzlebox_innertopsliderfront();
     translate([4, 16, 8])
	puzzlebox_innerbottomslider();
}

// Step 5.  Show the break-out of the back side and sliders

* union() {
     translate([0, 0, 50])
        puzzlebox_back();
     translate([8, 32, 0])
	puzzlebox_backshortslider();
     translate([8, 8, 0])
	puzzlebox_backlongslider();
     translate([58, 40, 100])
     rotate([0, 0, 180])
	puzzlebox_innertopsliderback();
     translate([4, 6, 100])
	puzzlebox_innerbottomslider();
}

// Step 6.  Show the completed back side

* union() {
     translate([0, 0, 4])
        puzzlebox_back();
     translate([8, 32, 0])
	puzzlebox_backshortslider();
     translate([8, 8, 0])
	puzzlebox_backlongslider();
     translate([64, 48, 8])
     rotate([0, 0, 180])
	puzzlebox_innertopsliderback();
     translate([8, 16, 8])
	puzzlebox_innerbottomslider();
}

// Step 7.  Show the completed middle assembly, in break-out form

* union() {

  // Fixed (2/6/2015)
  rotate([180, 0, 180])
  translate([-64, 0, -200])
  union() {	// front side
     translate([0, 0, 4])
        puzzlebox_back();
     translate([8, 32, 0])
	puzzlebox_backshortslider();
     translate([8, 8, 0])
	puzzlebox_backlongslider();
     translate([64, 48, 8])
     rotate([0, 0, 180])
	puzzlebox_innertopsliderback();
  }
  union() {	// back side
     translate([0, 0, 4])
        puzzlebox_front();
     translate([8, 32, 0])
	puzzlebox_frontshortslider();
     translate([8, 8, 0])
	puzzlebox_frontlongslider();
     translate([0, 36, 8])
	puzzlebox_innertopsliderfront();
     translate([4, 16, 8])
	puzzlebox_innerbottomslider();
  }
  rotate([90, 0, 180])
  translate([-56, 68, 8])
  union() { // middle
     translate([0, 0, 0])
	puzzlebox_middle_part1();
     translate([0, 0, 20-d])
	puzzlebox_middle_part2();
     translate([0, 0, 40-d2])
	puzzlebox_middle_part3();
  }
}

// Step 8.  Show the completed middle assembly, finished

* union() {

  rotate([180, 0, 180])
  translate([-64, 0, -80])
  union() {	// front side
     translate([0, 0, 4])
        puzzlebox_back();
     translate([8, 32, 0])
	puzzlebox_backshortslider();
     translate([8, 8, 0])
	puzzlebox_backlongslider();
     translate([64, 48, 8])
     rotate([0, 0, 180])
	puzzlebox_innertopsliderback();
  }
  translate([0, 0, 0])
  union() {	// back side
     translate([0, 0, 4])
        puzzlebox_front();
     translate([8, 32, 0])
	puzzlebox_frontshortslider();
     translate([8, 8, 0])
	puzzlebox_frontlongslider();
     translate([0, 36, 8])
	puzzlebox_innertopsliderfront();
     translate([4, 16, 8])
	puzzlebox_innerbottomslider();
  }
  rotate([90, 0, 180])
  translate([-56, 8, 8])
  union() { // middle
     translate([0, 0, 0])
	puzzlebox_middle_part1();
     translate([0, 0, 20-d])
	puzzlebox_middle_part2();
     translate([0, 0, 40-d2])
	puzzlebox_middle_part3();
  }
}

// Step 9.  Show the break-out of the bottom side

* union() {
     translate([12, 8, 0])
	puzzlebox_panelcover();
     translate([0, 0, 40])
	puzzlebox_bottompanel();
     translate([4, 8, 80])
	puzzlebox_bottominnerpanel();
}

// Step 10.  Show the bottom side, assembled

* union() {
     translate([12, 8, 0])
	puzzlebox_panelcover();
     translate([0, 0, 4])
	puzzlebox_bottompanel();
     translate([4, 8, 12])
	puzzlebox_bottominnerpanel();
}

// Step 11.  Show the break-out of the top side

* union() {
     translate([12, 8, 0])
	puzzlebox_panelcover();
     translate([0, 0, 40])
	puzzlebox_toppanel();
     translate([4, 4, 80])
	puzzlebox_topinnerpanel();
}

// Step 12.  Show the top side, assembled

* union() {
     translate([12, 8, 0])
	puzzlebox_panelcover();
     translate([0, 0, 4])
	puzzlebox_toppanel();
     translate([4, 4, 12])
	puzzlebox_topinnerpanel();
}

// Step 13.  Show the break-out of the left side

* union() {
     translate([12, 12, 0])
	puzzlebox_panelcover();
     translate([0, 0, 40])
	puzzlebox_leftpanel();
     translate([4, 6, 80])
	puzzlebox_leftinnerpanel();
}

// Step 14.  Show the left side, assembled

* union() {
     translate([12, 12, 0])
	puzzlebox_panelcover();
     translate([0, 0, 4])
	puzzlebox_leftpanel();
     translate([4, 8, 12])
	puzzlebox_leftinnerpanel();
}

// Step 15.  Show the break-out of the right side

* union() {
     translate([12, 12, 0])
	puzzlebox_panelcover();
     translate([0, 0, 40])
	puzzlebox_rightpanel();
     translate([4, 20, 80])
	puzzlebox_rightinnerpanel();
}

// Step 16.  Show the right side, assembled

* union() {
     translate([12, 12, 0])
	puzzlebox_panelcover();
     translate([0, 0, 4])
	puzzlebox_rightpanel();
     translate([4, 20, 12])
	puzzlebox_rightinnerpanel();
}

// Step 17.  Show the completed box, in break-out form

! union() {

  rotate([180, 0, 180])
  translate([-64, 0, -80])
  // rotate([180, 0, 0])
  // translate([0, -64, -80])
  union() {	// front side
     translate([0, 0, 4])
        puzzlebox_back();
     translate([8, 32, 0])
	puzzlebox_backshortslider();
     translate([8, 8, 0])
	puzzlebox_backlongslider();
     translate([64, 48, 8])
     rotate([0, 0, 180])
	puzzlebox_innertopsliderback();
  }
  translate([0, 0, 0])
  union() {	// back side
     translate([0, 0, 4])
        puzzlebox_front();
     translate([8, 32, 0])
	puzzlebox_frontshortslider();
     translate([8, 8, 0])
	puzzlebox_frontlongslider();
     translate([0, 36, 8])
	puzzlebox_innertopsliderfront();
     translate([4, 16, 8])
	puzzlebox_innerbottomslider();
  }
  rotate([90, 0, 180])
  translate([-56, 8, 8])
  union() { // middle
     translate([0, 0, 0])
	puzzlebox_middle_part1();
     translate([0, 0, 20-d])
	puzzlebox_middle_part2();
     translate([0, 0, 40-d2])
	puzzlebox_middle_part3();
  }

  translate([70, 150, 0])
  rotate([90, -90, 0])
  union() { // top
     translate([12, 8, 0])
	puzzlebox_panelcover();
     translate([0, 0, 4])
	puzzlebox_toppanel();
     translate([4, 4, 12])
	puzzlebox_topinnerpanel();
  }

  translate([70, -80, 70])
  rotate([90, 90, 180])
  union() { // bottom 
     translate([12, 8, 0])
	puzzlebox_panelcover();
     translate([0, 0, 4])
	puzzlebox_bottompanel();
     translate([4, 8, 12])
	puzzlebox_bottominnerpanel();
  }

  rotate([0, 90, 0])
  translate([-70, 0, -80])
  union() { // left
     translate([12, 12, 0])
	puzzlebox_panelcover();
     translate([0, 0, 4])
	puzzlebox_leftpanel();
     translate([4, 8, 12])
	puzzlebox_leftinnerpanel();
  }

  translate([140, 0, 0])
  rotate([0, 270, 0])
  union() { // right
     translate([12, 12, 0])
	puzzlebox_panelcover();
     translate([0, 0, 4])
	puzzlebox_rightpanel();
     translate([4, 20, 12])
	puzzlebox_rightinnerpanel();
  }
}

// Step 18.  Show the completed box, in solved form

* union() {

  rotate([180, 0, 180])
  translate([-64, 0, -80])
  // rotate([180, 0, 0])
  // translate([0, -64, -80])
  union() {	// front side
     translate([0, 0, 4])
        puzzlebox_back();
     translate([8, 32, 0])
	puzzlebox_backshortslider();
     translate([8, 8, 0])
	puzzlebox_backlongslider();
     translate([64, 48, 8])
     rotate([0, 0, 180])
	puzzlebox_innertopsliderback();
  }
  translate([0, 0, 0])
  union() {	// back side
     translate([0, 0, 4])
        puzzlebox_front();
     translate([8, 32, 0])
	puzzlebox_frontshortslider();
     translate([8, 8, 0])
	puzzlebox_frontlongslider();
     translate([0, 36, 8])
	puzzlebox_innertopsliderfront();
     translate([4, 16, 8])
	puzzlebox_innerbottomslider();
  }
  rotate([90, 0, 180])
  translate([-56, 8, 8])
  union() { // middle
     translate([0, 0, 0])
	puzzlebox_middle_part1();
     translate([0, 0, 20-d])
	puzzlebox_middle_part2();
     translate([0, 0, 40-d2])
	puzzlebox_middle_part3();
  }

  translate([64, 72, 4])
  rotate([90, -90, 0])
  union() { // top
     translate([12, 8, 0])
	puzzlebox_panelcover();
     translate([0, 0, 4])
	puzzlebox_toppanel();
     translate([4, 4, 12])
	puzzlebox_topinnerpanel();
  }

  translate([64, -8, 76])
  rotate([90, 90, 180])
  union() { // bottom 
     translate([12, 8, 0])
	puzzlebox_panelcover();
     translate([0, 0, 4])
	puzzlebox_bottompanel();
     translate([4, 8, 12])
	puzzlebox_bottominnerpanel();
  }

  rotate([0, 90, 0])
  translate([-76, -4, -8+d])
  union() { // left
     translate([12, 12, 0])
	puzzlebox_panelcover();
     translate([0, 0, 4])
	puzzlebox_leftpanel();
     translate([4, 8, 12])
	puzzlebox_leftinnerpanel();
  }

  translate([72, -4, 4])
  rotate([0, 270, 0])
  union() { // right
     translate([12, 12, 0])
	puzzlebox_panelcover();
     translate([0, 0, 4])
	puzzlebox_rightpanel();
     translate([4, 20, 12])
	puzzlebox_rightinnerpanel();
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

// "d" is for "delta" and is the amount of extra clearance needed beyond
// the exact measurments, to account for manufacturing tolerance.
d = 0.6;

// Set pin radius to 2mm.
pinrad = 2.0;

// For holes that face the build platform, the holes tend to pinch up
// and so need a larger value.  A multiplier of 1.12 increases the hole
// size by 12%.

base_hole_mult = 1.12;

//-------------------------------------------------------------------

// Set hole radius.  Calculated from pin radius and manufacturing tolerance.
// All pin and holes radii are scaled up by 10;  this gives a better circle
// approximation;  the circle is then scaled back down using scale() {}.

rpin = (pinrad * 10);
rhole = (rpin + d * 10);

r2hole = rhole * base_hole_mult;

hd = d / 2;
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
   linear_extrude(height=4, slices=2)
	    polygon( points=[[6, 4+d], [6, 60-d], [42, 60-d], [42, 4+d]] );

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

   // slats (build flat and rotate/translate into position)
   translate([0, 4+d, -d])
   rotate([90, 0, 0])
   difference () {
      linear_extrude(height=4+d, slices=2)
	   polygon( points=[[0+d, 0+d], [0+d, 8+d], [48-d, 8+d], [48-d, 0+d]] );
      translate([32, 4+d, 0]) {
	 linear_extrude(height=4+d, slices=2)
	     scale(1/10)
	   	 circle(r=rhole);
      }
      translate([16, 4+d, 0]) {
	  linear_extrude(height=4+d, slices=2)
	     scale(1/10)
	   	circle(r=rhole);
      }
   }
   translate([0, 64, -d])
   rotate([90, 0, 0])
   difference () {
      linear_extrude(height=4+d, slices=2)
	    polygon( points=[[0+d, 0+d], [0+d, 8+d], [48-d, 8+d], [48-d, 0+d]] );
      translate([32, 4+d, 0]) {
	    linear_extrude(height=4+d, slices=2)
	       scale(1/10)
	   	  circle(r=rhole);
      }
      translate([16, 4+d, 0]) {
	    linear_extrude(height=4+d, slices=2)
	       scale(1/10)
	   	  circle(r=rhole);
      }
   }
}

module puzzlebox_middle_part2() {
   // Start with walls, which support the third section

   // sides
   linear_extrude(height=20-d, slices=2)
	    polygon( points=[[0+d, 4+d], [0+d, 60-d], [3-d, 60-d], [3-d, 4+d]] );
   linear_extrude(height=20-d, slices=2)
	    polygon( points=[[45+d, 4+d], [45+d, 60-d], [48-d, 60-d], [48-d, 4+d]] );

   // slats (build flat and rotate/translate into position)
   translate([0, 4+d, -d])
   rotate([90, 0, 0])
   difference () {
      linear_extrude(height=4+d, slices=2)
	   polygon( points=[[0+d, 0+d], [0+d, 8+d], [48-d, 8+d], [48-d, 0+d]] );
      translate([32, 4+d, 0]) {
	 linear_extrude(height=4+d, slices=2)
	     scale(1/10)
	   	 circle(r=rhole);
      }
      translate([16, 4+d, 0]) {
	  linear_extrude(height=4+d, slices=2)
	     scale(1/10)
	   	circle(r=rhole);
      }
   }
   translate([0, 64, -d])
   rotate([90, 0, 0])
   difference () {
      linear_extrude(height=4+d, slices=2)
	    polygon( points=[[0+d, 0+d], [0+d, 8+d], [48-d, 8+d], [48-d, 0+d]] );
      translate([32, 4+d, 0]) {
	    linear_extrude(height=4+d, slices=2)
	       scale(1/10)
	   	  circle(r=rhole);
      }
      translate([16, 4+d, 0]) {
	    linear_extrude(height=4+d, slices=2)
	       scale(1/10)
	   	  circle(r=rhole);
      }
   }
}

module puzzlebox_middle_part3() {
   // sides
   linear_extrude(height=8, slices=2)
	    polygon( points=[[0+d, 4+d], [0+d, 60-d], [3-d, 60-d], [3-d, 4+d]] );
   linear_extrude(height=8, slices=2)
	    polygon( points=[[45+d, 4+d], [45+d, 60-d], [48-d, 60-d], [48-d, 4+d]] );

   // slats (build flat and rotate/translate into position)
   translate([0, 4+d, -d])
   rotate([90, 0, 0])
   difference () {
      linear_extrude(height=4+d, slices=2)
	   polygon( points=[[0+d, 0+d], [0+d, 8+d], [48-d, 8+d], [48-d, 0+d]] );
      translate([32, 4+d, 0]) {
	 linear_extrude(height=4+d, slices=2)
	     scale(1/10)
	   	 circle(r=rhole);
      }
      translate([16, 4+d, 0]) {
	  linear_extrude(height=4+d, slices=2)
	     scale(1/10)
	   	circle(r=rhole);
      }
   }
   translate([0, 64, -d])
   rotate([90, 0, 0])
   difference () {
      linear_extrude(height=4+d, slices=2)
	    polygon( points=[[0+d, 0+d], [0+d, 8+d], [48-d, 8+d], [48-d, 0+d]] );
      translate([32, 4+d, 0]) {
	    linear_extrude(height=4+d, slices=2)
	       scale(1/10)
	   	  circle(r=rhole);
      }
      translate([16, 4+d, 0]) {
	    linear_extrude(height=4+d, slices=2)
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
      linear_extrude(height=4, slices=2)
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
      linear_extrude(height=4, slices=2)
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
      linear_extrude(height=4, slices=2)
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
      linear_extrude(height=4, slices=2)
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
      linear_extrude(height=4, slices=2)
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
   linear_extrude(height=4, slices=2)
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
      linear_extrude(height=4, slices=2)
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
   linear_extrude(height=4, slices=2)
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
