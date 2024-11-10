// support carte

carte=[.5,88,55];
flyer=[.5,120,210];

ep=3.2;
y=flyer.y;

x1=30;
x2=30;
x3=80;
x4=x1+x3+3*ep;

z1=20;
z2=30;
z3=carte.z-20;

z4=z2+ep+z3+20;

z5=flyer.z-40;

alpha=20;


fond1();
translate([x1+ep,0,z2]) fond2();
translate([x4-ep,0,0]) facade();
translate([x1+ep,0,0]) cloison1();
translate([x1+x2+2*ep,0,z2]) cloison2();
dos();


cote();

module cote()
{
r=10;
 rotate([90,0,0])  union()
    {
        hull()
        {
            cube([.1,z5,ep]);
            translate([10,z5-r,0]) cylinder(ep,r,r,$fn=20);
            translate([x1,z4-r]) cylinder(ep,r,r,$fn=20);
        }
        hull()
        {
            
            translate([x1,z4-r]) cylinder(ep,r,r,$fn=20);
            cube([x4,z1,ep]);
        }
    }
}

module fond1()
{
cube([x4,y,ep]);
}

module fond2()
{
cube([x2+2*ep,y,ep]);
}


module dos()
{
    cube([ep,y,z5]);
}

module facade()
{
cube([ep,y,z1]);
}

module cloison1()
{
    cube([ep,y,z4]);
}

module cloison2()
{
    cube([ep,y,z3]);
}