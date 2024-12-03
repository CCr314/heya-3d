// prise USB Station

h=16;
x=23.5;
y=14;
d0=128;
yp=11.5;  // decalage plot sur Y
r=3;      // rayon plot

j=.3;

haut();
translate([0,y+4,0]) bas();

module bas()
{
h=4-j;
   translate([0,4+j,0]) cube([x,y-4-j,h]);
   translate([0,yp,0]) cylinder(h,r,r,$fn=20);
   translate([x,yp,0]) cylinder(h,r,r,$fn=20);
   translate([(x-7)/2+j,0,0]) cube([7-2*j,4+j,h]);
}

module haut()
{
difference()
{

    union()
    {
        intersection()
        {
            translate([x/2,d0/2,0]) union()
            {
                cylinder(h,d0/2,d0/2,$fn=300);
                translate([-x/2,-d0/2,0]) cube([x/2,d0/2,h]) ;
            }
            cube([x,y,h]);
        }
        translate([0,yp,0]) cylinder(h,r,r,$fn=20);
        translate([x,yp,0]) cylinder(h,r,r,$fn=20);
    }
    hull()
    {
        translate([x/2,-.1,5+3.5]) rotate([-90,0,0]) cylinder(y+.2,3.5,3.5,$fn=20);
        translate([x/2,-.1,5+3.5+h]) rotate([-90,0,0]) cylinder(y+.2,3.5,3.5,$fn=20);
    }
    hull()
    {
        translate([x/2-4,4,5+3.5]) rotate([-90,0,0]) cylinder(y+.2,4.5,4.5,$fn=20);
        translate([x/2+4,4,5+3.5]) rotate([-90,0,0]) cylinder(y+.2,4.5,4.5,$fn=20);
        translate([(x-8-2*4.5)/2,4,h-4]) cube([8+2*4.5,y,4]);
    }
    translate([-r,4,h-4]) cube([x+2*r,y,4]);
}
}

