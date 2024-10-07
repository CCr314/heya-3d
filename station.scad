// facade module principale

ep=3;
d0=128;
etx=95;

d1=65;
d2=85;
d3=94;

yclou=(d0/2-d2/2)/2+d2/2;

fond();
color("gray") translate([0,0,3+2]) e1(); 
translate([0,0,3+2+9+2]) e2();
//translate([0,0,3+2+9+2+9+2]) facade();


module fond()
{
    difference()
    {
        silouette(ep);
        vis() cylinder(ep,1.8,1.8,$fn=20);
        translate([-15/2-20,-20/2,0]) cube([15,20,ep+.1]) ;
        translate([20,0,0]) cylinder(ep+.1,2,2,$fn=20);
        // carte sd
        rotate([0,0,-90-45]) translate([-12,24+12,0]) cube([24,40-12+6,ep]);        
    }
}

module e1()
{
    d=75;
    ep=9;
    union()
    {
        difference()
        {
            silouette(ep);

            translate([0,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            translate([etx,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            translate([etx*2,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            translate([etx*3,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            
            translate([-44,-28/2,-.5]) cube([96,28,ep+1]);
            translate([etx,-28/2,-.5]) cube([52,28,ep+1]);
            translate([2*etx,-28/2,-.5]) cube([52,28,ep+1]);
            translate([3*etx,-28/2,-.5]) cube([52,28,ep+1]);
            
            // prise usb + antene
            translate([-24/2,-d0/2,-.5]) cube([24,d0/2+40,ep+1]);
            // carte sd
            rotate([0,0,-90-45]) translate([-10,24,0]) cube([20,40,ep]);
            
            vis() cylinder(ep,1.8,1.8,$fn=20);
            visCrochet(ep+1,10);
        }
        plots(ep,true);
        translate([etx,0,0]) plots(ep);
        translate([2*etx,0,0]) plots(ep);
        translate([3*etx,0,0]) plots(ep);
    }
}

module e2()
{
    ep=9;
    d=d3;
        difference()
        {
            silouette(ep);

            translate([0,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            translate([etx,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            translate([etx*2,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            translate([etx*3,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            
            translate([-44,-28/2,-.5]) cube([2*44+3*etx,28,ep+1]);
            vis() cylinder(ep,1.2,1.2,$fn=20);
            visCrochet(ep+1,4.2);
            
        }    
}


module silouette(ep)
{
    hull()
    {
        translate([0,0    ,0]) cylinder(ep,d0/2,d0/2,$fn=100);
        translate([etx*3,0,0]) cylinder(ep,d0/2,d0/2,$fn=100);
    }
}

module facade()
{

    difference()
    {

        silouette(ep);
        translate([0,0,-.5]) cylinder(ep+1,d2/2,d2/2,$fn=30);
        translate([etx,0,-.5]) cylinder(ep+1,d2/2,d2/2,$fn=30);
        translate([etx*2,0,-.5]) cylinder(ep+1,d2/2,d2/2,$fn=30);
        translate([etx*3,0,-.5]) cylinder(ep+1,d2/2,d2/2,$fn=30);
        
        visCrochet(ep+1,4.2);

    }

    translate([0,0,0]) cylinder(ep,d1/2,d1/2,$fn=30);
    translate([etx,0,0]) cylinder(ep,d1/2,d1/2,$fn=30);
    translate([etx*2,0,0]) cylinder(ep,d1/2,d1/2,$fn=30);
    translate([etx*3,0,0]) cylinder(ep,d1/2,d1/2,$fn=30);

        
}
    
    
module clous()
{
    color("gray") translate([0,yclou,0]) clou();
    color("gray") translate([etx,yclou,0]) clou();
    color("gray") translate([etx*2,yclou,0]) clou();
    color("gray") translate([etx*3,yclou,0]) clou();
}
module clou()
{
    translate([0,0,15]) cylinder(3,7,7,$fn=20);
    translate([0,0,0]) cylinder(15,3,3,$fn=20);
}
    
module vis()
{
        translate([-d0/2+6,0,0]) children();
        translate([-6,d0/2-8,0]) children();
        rotate([0,0,-18]) translate([0,-d0/2+6,0]) children();
        translate([20,-d0/2+6,0]) children();
        translate([3*etx/2,d0/2-6,0]) children();
        translate([3*etx/2,-d0/2+6,0]) children();
        translate([3*etx+6,d0/2-8,0]) children();
        translate([3*etx,-d0/2+6,0]) children();
        translate([etx*3+d0/2-6,0,0]) children();
}

module visCrochet(ep,d)
{
    translate([0,yclou,0]) cylinder(ep,d/2,d/2,$fn=20);
    translate([etx,yclou,0]) cylinder(ep,d/2,d/2,$fn=20);
    translate([2*etx,yclou,0]) cylinder(ep,d/2,d/2,$fn=20);
    translate([3*etx,yclou,0]) cylinder(ep,d/2,d/2,$fn=20);
}


module plots(ep,first=false)
{
    rotate([0,0,20]) plot(ep);
    rotate([0,0,20+360/3]) plot(ep);
    if(!first)
        rotate([0,0,180+45]) plot(ep);

}


module plot(ep)
{
difference()
{
    hull()
    {   
        translate([0,37,0]) cylinder(ep,4,4,$fn=20);
        translate([-6,42,0]) cube([12,.1,ep]);
    }
    translate([0,37,0]) cylinder(ep,1.2,1.2,$fn=20);
}
}