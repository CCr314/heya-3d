// prise USB Station

h=19.8;
x=23.5;
y=16;
d0=128;
yp=11.5;  // decalage plot sur Y
r=3;      // rayon plot

difference()
{

    union()
    {
        intersection()
        {
            translate([x/2,d0/2,0]) union()
            {
                cylinder(h,d0/2,d0/2,$fn=300);
                translate([0,-d0/2,0]) cube([x,d0/2,h]) ;
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
    }
}