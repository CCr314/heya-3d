// support carte
include <connecteurs3.scad>

carte=[.5,88,55];
flyer=[.5,100,210];

ep=3.2;
y=flyer.y;

ye=y-ep;  // position encoche

le=6; // largeur encoche

x1=30;
x2=30;
x3=80;
x4=x1+x3+3*ep;

z1=20;  // face avant
z2=30;  // hauteur bac carte de visites
z3=carte.z-25;

z4=z2+ep+z3+20;

z5=flyer.z-40;

alpha=20;


//fond1();
//translate([x1+ep,0,z2]) fond2();
//translate([x4-ep,0,0]) facade();
//translate([x1+ep,0,0]) cloison1();
//translate([x1+x2+2*ep,0,z2]) cloison2();
//dos();


cote();
//translate([0,y,0^]) cote();




module cote()
{
r=10;
 rotate([90,0,0]) difference()
    { 
    union()
    {
        hull()
        {
            cube([.1,z5,ep]);
            translate([10,z5-r,0]) cylinder(ep,r,r,$fn=20);
            translate([x1,z4-r+5]) cylinder(ep,r,r,$fn=20);
        }
        hull()
        {
            
            translate([x1,z4-r+5,0]) cylinder(ep,r,r,$fn=20);
            cube([x4,.1,ep]);
            translate([x4-r,z1,0]) cylinder(ep,r,r,$fn=20);

        }
        difference()
        {
            translate([x1+3,z4-5,0]) cube([10,10,ep]);
            translate([x1+r+7.5,z4+6.5,-.1]) cylinder(ep+.2,r,r,$fn=30);
        }
    }
        connecteurFemelle([ep,z5,ep],le,.2);
        connecteurFemelle([x4,ep,ep],le,.2);
        translate([x4-ep,0,0]) connecteurFemelle([ep,z1,ep],le,.2);
        translate([x1+ep,z2,0]) connecteurFemelle([x2+2*ep,ep,ep], le, .2);
        translate([x1+ep,0,0]) connecteurFemelle([ep,z4,ep], le, .2);
        translate([x1+x2+2*ep,z2,0]) connecteurFemelle([ep,z3,ep], le, .2);

    }
}

module fond1()
{
difference()
{
    cube([x4,y,ep]);
    connecteurFemelle([x4,ep,ep], le, .2);
    translate([0,ye,0]) connecteurFemelle([x4,ep,ep], le, .2);
    connecteurFemelle([ep,y,ep], le, .2);
    translate([x4-ep,0,0]) connecteurFemelle([ep,y,ep], le, .2);

    }

}

module fond2()
{
    difference()
    {
        cube([x2+2*ep,y,ep]);
        connecteurMale([x2+2*ep,ep,ep], le, .2);
        translate([0,ye,0]) connecteurMale([x2+2*ep,ep,ep], le, .2);

        connecteurMale([ep,y,ep], le, .2);
        translate([x2+2*ep-ep,0,0]) connecteurMale([ep,y,ep], le, .2);

    }
}


module dos()
{
    difference()
    {
        cube([ep,y,z5]);
        connecteurMale([ep,y,ep], le, .2);
        connecteurMale([ep,ep,z5], le, .2);
        translate([0,ye,0]) connecteurMale([ep,ep,z5], le, .2);

    }
}

module facade()
{
    difference()
    {
        cube([ep,y,z1]);
        connecteurMale([ep,y,ep], le, .2);
        connecteurMale([ep,ep,z1], le, .2);
        translate([0,ye,0]) connecteurMale([ep,ep,z1], le, .2);

    }
}

module cloison1()
{
    difference()
    {
        cube([ep,y,z4]);
        connecteurMale([ep,y,ep], le, .2);
        translate([0,0,z2]) connecteurFemelle([ep,y,ep], le, .2);
        connecteurMale([ep,ep,z4], le, .2);
        translate([0,ye,0]) connecteurMale([ep,ep,z4], le, .2);
        
    }
}

module cloison2()
{
    difference()
    {
        cube([ep,y,z3]);
        connecteurFemelle([ep,y,ep], le, .2);
        connecteurMale([ep,ep,z3], le, .2);
        translate([0,ye,0]) connecteurMale([ep,ep,z3], le, .2);
    }
}