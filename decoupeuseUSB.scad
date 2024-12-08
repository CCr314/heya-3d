// decoupe usb

include <ecrouM4.scad>
include <ecrouM8.scad>
include <secteur.scad>

roue();


//supportFraisage();

//entretoise();

//translate([0,0,30]) verrou();

//axeponceuse();

module entretoise(h=6.1)
{
    difference()
    {
        cylinder(h,7,7,$fn=20);
        cylinder(h,4.3,4.3,$fn=20);
        
    }
}

module entretoise2(h=10)
{
    difference()
    {
        union()
        {
            cylinder(h,6,6,$fn=20);
            cylinder(h-2,10,6,$fn=20);
        }
        cylinder(h,4.3,4.3,$fn=20);
        
    }
}


module axeponceuse()
{
        di=96;
    da=18;
    dr=22.5;
    h=20;
    difference()
    {
        cylinder(7.2,dr/2+.3,dr/2-.3,$fn=40);
        cylinder(h,4.2,4.2,$fn=20);
        //ecrouM8(5);
    }
}

module butee()
{
    alpha=35;
    lmin=30;
    lmax=40;
    h=20;
    hr=3;
    difference()
    {
        union()
        {
            secteur(h,2*lmax,alpha);
            rotate([0,0,alpha/2]) translate([0,-9.8/2,h]) cube([lmax,9.8,hr]);
        }
        cylinder(h+hr,lmin,lmin,$fn=50);
        #rotate([0,0,alpha/2]) translate([(lmax-lmin)/2+lmin,0,0]) cylinder(h+hr,4.2,4.2,$fn=20);
    }
    
}

module testImpression()
{
        di=96;
    da=18;
    dr=22.6;
    h=27+7;

            ep=5;
    
            #intersection()
            {
                cylinder(h,di/2-5,di/2-5,$fn=20);
                union()
                {
                translate([ep,ep,0]) cube([di/2,di/2,h]);
                translate([-di/2-ep,ep,0]) cube([di/2,di/2,h]);
                translate([ep,-di/2-ep,0]) cube([di/2,di/2,h]);
                translate([-di/2-ep,-di/2-ep,0]) cube([di/2,di/2,h]);
                }
            }
            //cylinder(h,14,14,$fn=20);

}

module roue()
{
    di=96;
    da=18;
    dr=22.5;
    h=22;
    
    hbutee=4;
    
    //ep=4;
    
    difference()
    {
        union()
        {
            cylinder(h-3,di/2,di/2,$fn=100);
            cylinder(hbutee,di/2+3,di/2+3,$fn=100);
            translate([0,0,hbutee]) cylinder(4,di/2+.3,di/2,$fn=100);
            translate([0,0,h-3]) cylinder(3,di/2,di/2-1,$fn=100);
            
        }
        cylinder(h+.2,da/2,da/2,$fn=20);
        cylinder(7.2,dr/2,dr/2,$fn=40);
        translate([0,0,h-7.2]) cylinder(7.2,dr/2,dr/2,$fn=40);
        
        
        
        difference()
        {
            ep=4;
            intersection()
            {
                cylinder(h+.1,di/2-1.2*ep,di/2-1.2*ep,$fn=100);
                union()
                {
                
                translate([ep,ep,0]) cube([di/2,di/2,h+.1]);
                translate([-di/2-ep/2,ep/2,0]) cube([di/2,di/2,h+.1]);
                translate([ep/2,-di/2-ep/2,0]) cube([di/2,di/2,h+.1]);
                translate([-di/2-ep/2,-di/2-ep/2,0]) cube([di/2,di/2,h+.1]);
                }
            }
            cylinder(h+.1,14,14,$fn=20);
        }
        
        translate([di/2-15,0,12]) rotate([-90,0,0]) ecrouM4(6);
        translate([di/2-15,-6,12]) rotate([-90,0,0]) cylinder(20,2.2,2.2,$fn=20);
        translate([di/2-15,-40-5,12]) rotate([-90,0,0]) cylinder(40,5,5,$fn=20);
        translate([0,di/2-15,12]) rotate([0,90,0]) ecrouM4(6);
        translate([-6,di/2-15,12]) rotate([0,90,0]) cylinder(20,2.2,2.2,$fn=20);
        translate([-40-5,di/2-15,12]) rotate([0,90,0]) cylinder(40,5,5,$fn=20);
        
        // trou fraise
        hull()
        {
            rotate([0,0,-90-45+5]) translate([di/2-15,0,10+2]) rotate([0,90,0]) cylinder(20,5,5,$fn=20);
            rotate([0,0,-90-45-5]) translate([di/2-15,0,10+2]) rotate([0,90,0]) cylinder(20,5,5,$fn=20);
        }
    }
    
    translate([-34,-9.8,0]) difference()
    {
        cylinder(h,10,10,$fn=20);
        cylinder(h,4.2,4.2,$fn=20);
        ecrouM8(9);
        
    }
    
}

module supportFraisage()
{
    di=96;
    
    de1=110;
    de2=120;
    
    da=80;
    dr=22.5;
    h=32;
    
    //ep=4;
    
    difference()
    {
        union()
        {
            cylinder(h-3,di/2,di/2,$fn=100);
            cylinder(2,di/2+3,di/2+3,$fn=100);
            translate([0,0,2]) cylinder(4,di/2+.3,di/2,$fn=100);
            translate([0,0,h-3]) cylinder(3,di/2,di/2-1,$fn=100);
            
        }
        cylinder(h+.2,da/2,da/2,$fn=20);
    }
}


module verrou()
{
h=25;
di=96;
da=18;
dr=22.5;
   ep=4;
   
   difference()
   {
    union()
    {
    intersection()
    {
        union()
        {
        translate([0,0,5]) cylinder(h+.1,di/2-1.2*ep-.5,di/2-1.2*ep-.5,$fn=100);
        cylinder(5,di/2-1.2*ep-.5-5,di/2-1.2*ep-.5,$fn=100);
        }
        hull()
        {
            translate([-di/2-ep/2,-di/2-ep/2,5]) cube([di/2,di/2,h+.1-5]);
            translate([-di/2-ep/2,-di/2-ep/2,0]) cube([di/2-5,di/2-5,h+.1]);
        }
    }
    translate([0,0,h-3]) intersection()
    {
        cylinder(3,di/2+3,di/2+3,$fn=100);
        translate([-di/2-ep/2,-di/2-ep/2,0]) cube([di/2,di/2,h+.1]);
    }
    }
    translate([-34,-9.8,0])
    union()
    {
        cylinder(h-3,12,12,$fn=20);
        cylinder(5,12+5,12,$fn=20);
        cylinder(h+.2,4.5,4.5,$fn=20);
    }
    cylinder(h+.2,14.3,14.3,$fn=20);
    }
}


