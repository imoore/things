// Compartments.scad

Drawer_depth = 372 ;
Drawer_width = 244 ;

Compartment_width = 81 ;
Compartment_l1    = Drawer_depth  ;
Compartment_l2    = 240 ;
Compartment_l3    = Drawer_depth - Compartment_l2 ;
Compartment_w3    = Compartment_width * 2 ;
Compartment_ft    = 0.5 ; //@@ 1 ;  //Thickness of floor
Compartment_st    = 2 ;  //Thickness of sides
Compartment_h     = 2 ; //@@ 35 ;

Corner_cutout     = 22 ;
Latch_cutout_w1   = 50 ;
Latch_cutout_d1   = 10 ;
Latch_cutout_w2   = 28 ;
Latch_cutout_d2   = 20 ;
Latch_cutout_x1   = Compartment_w3/2 - Latch_cutout_w1/2 ;
Latch_cutout_x2   = Compartment_w3/2 - Latch_cutout_w2/2 ;
Latch_cutout_x3   = Compartment_w3/2 + Latch_cutout_w2/2 ;
Latch_cutout_x4   = Compartment_w3/2 + Latch_cutout_w1/2 ;

module compartment_1() {
    module compartment_outline() {
        polygon(
        [
            [0,Corner_cutout],
            [0,Compartment_l1],
            [Compartment_width,Compartment_l1],
            [Compartment_width,0],
            [Corner_cutout,0],
        ]) ;
    }
    module compartment_inside() {
        offset(r=+3) offset(delta=-(Compartment_st+3)) compartment_outline() ;
    }
    module compartment_outside() {
        offset(r=+3) offset(r=-3) compartment_outline() ;
    }
    module compartment_sides() {
        difference() {
            compartment_outside() ;
            compartment_inside() ;
        }
    }
    // Result
    linear_extrude(height=Compartment_ft) compartment_outside() ;   // Floor
    linear_extrude(height=Compartment_h)  compartment_sides() ;     // Sides
}

module compartment_2() {
    module compartment_outline() {
        polygon(
        [
            [0,0],
            [0,Compartment_l2],
            [Compartment_width,Compartment_l2],
            [Compartment_width,0],
        ]) ;
    }
    module compartment_inside() {
        offset(r=+3) offset(delta=-(Compartment_st+3)) compartment_outline() ;
    }
    module compartment_outside() {
        offset(r=+3) offset(r=-3) compartment_outline() ;
    }
    module compartment_sides() {
        difference() {
            compartment_outside() ;
            compartment_inside() ;
        }
    }
    // Result
    linear_extrude(height=Compartment_ft) compartment_outside() ;   // Floor
    linear_extrude(height=Compartment_h)  compartment_sides() ;     // Sides
}

module compartment_3() {
    module compartment_outline() {
        polygon(
        [
            // @@@@@ cutouts and corner
            [0,0],
            [0,Compartment_l3],
            [Compartment_w3,Compartment_l3],
            [Compartment_w3,Corner_cutout],
            [Compartment_w3-Corner_cutout,0],
            [Latch_cutout_x4,0],
            [Latch_cutout_x4,Latch_cutout_d1],
            [Latch_cutout_x3,Latch_cutout_d1],
            [Latch_cutout_x3,Latch_cutout_d2],
            [Latch_cutout_x2,Latch_cutout_d2],
            [Latch_cutout_x2,Latch_cutout_d1],
            [Latch_cutout_x1,Latch_cutout_d1],
            [Latch_cutout_x1,0],
        ]) ;
    }
    module compartment_inside() {
        offset(r=+3) offset(delta=-(Compartment_st+3)) compartment_outline() ;
    }
    module compartment_outside() {
        offset(r=+3) offset(r=-3) compartment_outline() ;
    }
    module compartment_sides() {
        difference() {
            compartment_outside() ;
            compartment_inside() ;
        }
    }
    // Result
    linear_extrude(height=Compartment_ft) compartment_outside() ;   // Floor
    linear_extrude(height=Compartment_h)  compartment_sides() ;     // Sides
}



// compartment_1() ;
// compartment_2() ;
compartment_3() ;

