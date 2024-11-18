// couches station

ep=3;
d0=128;
etx=95;

d1=67; // 65;
d2=87; // 85;
d3=100;

yclou=(d0/2-d2/2)/2+d2/2;

hc=10;


//projection() 
//fond();

//rotate([0,0,-90-45]) translate([-16+.5,24+.5,0]) trappeSD();


//color("gray") translate([0,0,3+hc])
//projection()
//c1(); 


//translate([0,0,3+hc+9+hc])
//projection()
c2();

//translate([0,0,3+hc+9+hc+6]) 
//projection() pmmaC2();


//translate([0,0,3+hc+9+hc+9+hc]) 
// projection() 
//facade();


module fond()
{
    difference()
    {
        silouette(ep);
        vis() cylinder(ep,1.8,1.8,$fn=20);
        translate([-12/2-19,-20/2,0]) cube([12,22,ep+.1]) ;
        translate([21,1,0]) cylinder(ep+.1,2,2,$fn=20);
        // carte sd
        rotate([0,0,-90-45]) translate([-16,24,0]) cube([32,42,ep]);        
        
        
        translate([55,40,0]) fixation(ep,10,5);
        translate([3*etx-55,40,0]) fixation(ep,10,5);
    }
}

module trappeSD()
{
ep=3;
x=31;
y=41;

    difference()
    {
        union()
        {
            cube([x,y,ep]);

            // griffe arriere
            translate([.5,-4,ep]) cube([x-1,8,ep]);
        }
        // vis
        translate([x/2,y-3.5]) cylinder(ep,3,1.6,$fn=20);
    }
    
}

module c1()
{
    d=75;
    ep=9;
    union()
    {
        difference()
        {
            silouette(ep);
            
            
            // Pods
            translate([0,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            translate([etx,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            translate([etx*2,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            translate([etx*3,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            
            // evidement barette centrale
            translate([-40,-28/2,-.5]) cube([90,28,ep+1]);
            translate([etx,-28/2,-.5]) cube([50,28,ep+1]);
            translate([2*etx,-28/2,-.5]) cube([50,28,ep+1]);
            translate([3*etx,-28/2,-.5]) cube([42,28,ep+1]);
            
            // prise usb + antene
            translate([-10,0,-.5]) cube([12,d/2+5,ep+1]);
            translate([-24/2,-d0/2,-.5]) cube([24,d0/2,ep+1]);
            
            // carte sd
            rotate([0,0,-90-45]) translate([-15,24,0]) cube([30,35,ep]);
            rotate([0,0,-90-45]) translate([0,24+42-3.5,0]) cylinder(ep+1,.8,.8,$fn=10);
            
            // composant radio
            rotate([0,0,+45]) translate([-10,24,0]) cube([20,15,ep]);            
            vis() cylinder(ep,1.8,1.8,$fn=20);
            visCrochet(ep+1,10);
            
            // fixation
            translate([55,40,0]) fixation(ep,10,10);
            translate([3*etx-55,40,0]) fixation(ep,10,10);
            #trouCentreur(ep);
        }
        plots(ep,true);
        translate([etx,0,0]) plots(ep);
        translate([2*etx,0,0]) plots(ep);
        translate([3*etx,0,0]) plots(ep);
        

    }
}

module c2()
{
    ep=9;
    d=d3;
    ly=55;  //largeur fente centrale
        difference()
        {
            silouette(ep);

            translate([0,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            translate([etx,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            translate([etx*2,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            translate([etx*3,0,-.5]) cylinder(ep+1,d/2,d/2,$fn=30);
            
            // decoupe centrale
            translate([0,-ly/2,-.5]) cube([3*etx,ly,ep+1]);
            vis() cylinder(ep,1.2,1.2,$fn=20);
            visCrochet(ep+1,4.2);
            #trouCentreur(ep);
        }    
}

module pmmaC2()
{
d=d3-1;
ep=3.2;

dc=61; // diametre carte centrale;

    difference()
    {
        union()
        {
            translate([0,0,0]) cylinder(ep,d/2,d/2,$fn=30);
            translate([etx,0,0]) cylinder(ep,d/2,d/2,$fn=30);
            translate([etx*2,0,0]) cylinder(ep,d/2,d/2,$fn=30);
            translate([etx*3,0,0]) cylinder(ep,d/2,d/2,$fn=30);       
            translate([0,-50/2+1,0]) cube([3*etx,50-2,ep]);
        }

        translate([0,0,-.5]) cylinder(ep+1,dc/2,dc/2,$fn=30);
        translate([etx,0,-.5]) cylinder(ep+1,dc/2,dc/2,$fn=30);
        translate([etx*2,0,-.5]) cylinder(ep+1,dc/2,dc/2,$fn=30);
        translate([etx*3,0,-.5]) cylinder(ep+1,dc/2,dc/2,$fn=30);       
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
        translate([0,0,-.5]) cylinder(ep+1,d2/2,d2/2,$fn=100);
        translate([etx,0,-.5]) cylinder(ep+1,d2/2,d2/2,$fn=100);
        translate([etx*2,0,-.5]) cylinder(ep+1,d2/2,d2/2,$fn=100);
        translate([etx*3,0,-.5]) cylinder(ep+1,d2/2,d2/2,$fn=100);
        
        visCrochet(ep+1,4.2);

    }

    translate([0,0,0]) cylinder(ep,d1/2,d1/2,$fn=100);
    translate([etx,0,0]) cylinder(ep,d1/2,d1/2,$fn=100);
    translate([etx*2,0,0]) cylinder(ep,d1/2,d1/2,$fn=100);
    translate([etx*3,0,0]) cylinder(ep,d1/2,d1/2,$fn=100);
    //clous();
        
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
        rotate([0,0,18])translate([0,d0/2-6,0]) children();
        rotate([0,0,-18]) translate([0,-d0/2+6,0]) children();
        translate([20,-d0/2+6,0]) children();
        translate([3*etx/2,d0/2-6,0]) children();
        translate([3*etx/2,-d0/2+6,0]) children();
        translate([3*etx,0,0]) rotate([0,0,-18]) 
            translate([0,d0/2-6,0]) children();
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
    rotate([0,0,-16]) plot(ep);
        
    rotate([0,0,16+360/3]) plot(ep);
    if(!first)
        rotate([0,0,180+45]) plot(ep);

}


module plot(ep)
{
difference()
{
    hull()
    {   
        translate([0,32.5,0]) cylinder(ep,4,4,$fn=20);
        translate([-6,42,0]) cube([12,.1,ep]);
    }
    translate([0,32.5,0]) cylinder(ep,1.2,1.2,$fn=20);
}
}


module fixation(ep,db,dh)
{
    cylinder(ep+.1,db/2,db/2,$fn=20);
    hull()
    {
        translate([0,0,-.1])cylinder(ep+.2,dh/2,dh/2,$fn=20);
        translate([0,10,-.1])cylinder(ep+.2,dh/2,dh/2,$fn=20);
    }

}

module trouCentreur(h)
{
    translate([30,50,-.1]) cylinder(h+.2,5.2,5.2,$fn=20);
    translate([3*etx-30,50,-.1]) cylinder(h+.2,5.2,5.2,$fn=20);
    translate([60,-50,-.1]) cylinder(h+.2,5.2,5.2,$fn=20);
    translate([3*etx-60,-50,-.1]) cylinder(h+.2,5.2,5.2,$fn=20);

    }