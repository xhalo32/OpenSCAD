segments = 64;

scale(0.2)
rotate([0, 0, 0])
translate([0, 0, 0]) {

translate([0, 0, 160])
difference () {
    rotate_extrude(convexity = 10, $fn = segments) {
	import_dxf(file = "rook_profile.dxf");
    }

    // Four cutouts

    translate([0, 0, 20]) {
      for (i = [0:3])
      {
        rotate([0, 0, 90*i])
          linear_extrude(height = 20) {
  	    polygon( points=[[0,0],[60,30],[30,60]] );
          }
        
      }
    }

}

}
