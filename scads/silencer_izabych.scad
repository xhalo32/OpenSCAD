/*
	QuickCan Parametric Printable Silencer Tool - quickcan.scad
	by Hillary Izabych
	July 4th, 2015

	FOR LAW ENFORCEMENT, MILITARY, AND LAWFUL CIVILIAN USE ONLY!  ALL NFA RULES APPLY.

	This parametric OpenSCAD script designs a 3D printable part that converts a common "flash can"
	muzzle brake into a .22 caliber sound suppressor, a.k.a. silencer.  In order to legally make a
	silencer using this script (in the United States), do the following:

	* Ensure that you live in a state where silencers are legal to own.
	* Purchase a "flash can" muzzle brake (there are plenty on Amazon, eBay, etc.)
	* Using a caliper, measure the outer diameter (in millimeters) of your flash can.
	* Edit the first few lines of this script to reflect your measured flash_can_OD, and desired
	  length_overlap_portion and length_baffle_portion.  Remember that everything is in millimeters.
	* Hit Design-->Compile and Render (CGAL).
	* Hit File-->Export-->Export as STL..., then pick a file name and save it.
	* Create a legal trust.
	* Create a bank account in the name of the trust, and put at least $200 in it.
	* File a Form 1 with the ATF.  Pay the $200 bribe with a check from your trust's bank account.
	* Wait for the ATF to approve your tax stamp.
	* Import the STL file into your slicer program, and generate gcode for your printer.
	* Print your silencer in ABS, nylon, HIPS, or a similarly strong, high-temperature polymer.
	* Jam it over the flash can and secure it in place with tape.  If the fit is too tight, heat the
	  printed part with a heat gun until it slides on easy.  When it cools, the polymer will contract
	  and grab the flash can with a ton of force.
	* You are now ready for some quiet plinking fun!

	To design a silencer, all this script needs is the outer diameter of your flash can.  Optionally,
	you can specify the lengths of the overlap and baffle portions of the tube.  By default, it will
	design you a silencer with standard M baffles.  It will automatically compute the number of
	baffles required to fill your silencer tube.  The entire device prints as one piece, and should
	require no support material.

	Rounds more powerful than .22 LR are not recommended.  Standard .22 LR ammunition is usually
	supersonic, meaning these rounds will be somewhat loud no matter what.  For the quietest shooting
	enjoyment, use subsonic rounds, like .22 short, CB, Super Colibri, or the rare ".22 LR subsonic"
	(these usually have a long, heavy bullet).


	Troubleshooting:

	PROBLEM: The printable part is too tall for my 3D printer.
	SOLUTION: Change "length_baffle_portion" and "length_overlap_portion" to fixed values small
			  enough to print in 1 piece.  The sum of these values, plus end_cap_thickness, will
			  equal the can's overall length.

	PROBLEM: I am getting baffle strikes, i.e. the bullet sometimes hits the baffles.
	SOLUTION: Change radius_baffle_hole to a larger number.  You can also try reducing
			  length_baffle_portion, since longer silencers will amplify alignment problems.

	PROBLEM: The printable part fits too tightly over the flash can.
	SOLUTION: Increase part_swell.  The script will compensate for your printer's inaccuracy.

	PROBLEM: The printable part fits too loosely over the flash can.
	SOLUTION: Decrease part_swell.  Your printer is more accurate than the one this script was
			  written for.

	PROBLEM: The silencer is not durable; baffles are blowing out, tube is cracking, etc.
	SOLUTION: Increase standard_thickness.  This will make walls thicker at the expense of gas
			  expansion volume.  Also consider painting your printed part with ABS mixed with
			  acetone.  This will seal any cracks in the tube.

	PROBLEM: I'm in prison because I printed this without first filing a Form 1.
	SOLUTION: Read the instructions carefully.  Get your tax stamp before you press "print".
*/


// global variables

// user-modifiable variables <-- CHANGE THESE TO MATCH YOUR SPECIFIC FLASH CAN AND DESIRED SPECS!!
flash_can_OD = 34.61; // measured outer diameter of flash can
length_overlap_portion = 40; // length of tube that will overlap flash can
length_baffle_portion = 100;  // length of tube that will contain baffles

$fn = 72; // number of facets for polygonal approximation of circles (SketchUp default is 36)
		  // high number = smooth finish; low number = quick rendering and small STL file.

// 3D printer-specific stuff
part_swell = 0; // amount by which the outer radius of a printed part will exceed the designed
				    // outer radius.  for many printers, this value will be around 0.2 mm.
				    // for a theoretical ideal printer that prints everything exactly as designed,
				    // you would set this value to zero.

// computed flash can radii - leave this alone
flash_can_OR = flash_can_OD / 2; // computed outer radius of flash can
//flash_can_IR = flash_can_ID / 2; // computed inner radius of flash can; not used as of version 3

standard_thickness = 3; // a thickness used for tube_thickness, baffle_wall_thickness,
						 // and end_cap_thickness.  default=2

// outer tube
tube_thickness = standard_thickness; // thickness of silencer tube wall
tube_IR = flash_can_OR + part_swell; // inner radius of printed tube
tube_OR = tube_IR + tube_thickness; // outer radius of printed tube
length_tube = length_overlap_portion + length_baffle_portion;

// baffles
baffle_wall_thickness = standard_thickness; // default=1
baffle_height = tube_IR; // default=10
baffle_OR = tube_IR + baffle_wall_thickness; // for fixed baffles
baffle_IR = tube_IR; // for fixed baffles
number_of_baffles = length_baffle_portion / baffle_height;
radius_baffle_hole = 3.81; // r=3.81, d=7.62 (a.k.a. 30 cal), appropriate for .22

// end cap
end_cap_thickness = standard_thickness; // adds to the overall length

// compute overall length (OAL)
length_overall = length_tube + end_cap_thickness; // overall length (OAL)

// echo some stats that might be interesting to the user
echo("flash_can_OD:", flash_can_OD);
echo("length_overlap_portion:", length_overlap_portion);
echo("length_baffle_portion:", length_baffle_portion);
//echo("end_cap_thickness:", end_cap_thickness);
echo("length_overall:", length_overall);
echo("number_of_baffles:", number_of_baffles);


// modules

module suppressor_body_solid()
{
	// outer tube
	cylinder(h=length_tube, r=tube_OR, center=false);
}

module suppressor_body()
{
	difference()
	{
		suppressor_body_solid(); // build a solid outer shell
		translate([0, 0, -1]) // drill out the center cavity
			cylinder(h=length_tube+2, r=tube_IR, center=false);
	}
}

module simple_baffle()
{
	difference()
	{
		// outer shell
		cylinder(h=baffle_height, r=baffle_OR, center=false);
		// hole for bullet
		translate([0, 0, -1])
			cylinder(h=baffle_height+2, r=radius_baffle_hole, center=false);
		// hole for expansion chamber
		translate([0, 0, baffle_wall_thickness])
			cylinder(h=baffle_height, r=baffle_IR, center=false);
	}
}

module m_baffle()
{
	difference()
	{
		// inner cone
		difference()
		{
			// positive part
			cylinder(h = baffle_height, r1=baffle_OR, r2=radius_baffle_hole, center=false);

			// negative part
			// same as positive part, but translated down
			translate([0, 0, -baffle_wall_thickness])
				cylinder(h = baffle_height, r1=baffle_OR, r2=radius_baffle_hole, center=false);
		}

		// hole for bullet
		translate([0, 0, -1])
			cylinder(h=baffle_height+2, r=radius_baffle_hole, center=false);
	}
}

module baffle_stack()
{
	for (i = [0:number_of_baffles-1])
	{
		translate([0, 0, i * baffle_height])
		{
			//simple_baffle();
			m_baffle(); // the M baffle is better, and the whole stack should print without supports!
		}
	}
}

module end_cap()
{
	difference()
	{
		// outer body
		cylinder(h=end_cap_thickness, r=tube_OR, center=false);
		// bullet hole
		translate([0, 0, -1])
		cylinder(h=end_cap_thickness+2, r=radius_baffle_hole, center=false);
	}
}


module silencer_disassembled()
{
	// individual components
	translate([-50, 0, 0]) suppressor_body();
	translate([0, 0, 0]) baffle_stack();
	translate([50, 0, -end_cap_thickness]) end_cap();
}


module silencer()
{
	// fully assembled
	translate([0, 0, 0]) suppressor_body();
	translate([0, 0, 0]) baffle_stack();
	translate([0, 0, -end_cap_thickness]) end_cap();
}


//translate([0, 0, end_cap_thickness]) silencer(); // shift upward so it's sitting on the ground

translate([0, 50, end_cap_thickness]) silencer_disassembled(); // shift upward so it's sitting on the ground