// heya relais

x=48;
y=30;
z=5;

e=3;

ecl=10;

difference()
{
    silouette(3);
    trous() cylinder(3,2,2,$fn=20);
}

translate([0,0,3+ecl]) difference()
{
    silouette(5);
    esp(5);
    trous() cylinder(5,1.2,1.2,$fn=20);
}

//translate([0,0,3+5+2*ecl]) silouette(3);

module silouette(h)
{
   hull()
   {
    cylinder(h,y/2+e,y/2+e,$fn=100);
    translate([x,0,0]) cylinder(h,y/2+e,y/2+e,$fn=100);
   }
}

module esp(h)
{
    translate([0,-28.5/2,0]) cube([46.5,28.5,h]);
    translate([46.5,-18/2,0]) cube([6,18,h]);
    translate([-20,-13,0]) cube([20,12,h]);
    
}

module trous()
{
    translate([-5,y/2-2,0]) children();
    translate([-14,2,0]) children();

    translate([x+5,-y/2+2,0]) children();
    translate([x+5,y/2-2,0]) children();
}