// ecrou

include <ecrous.scad>

h1=5;

h3=20;

d=25;

difference()
{
union()
{
cylinder(2,d/2-2,d/2);
translate([0,0,2]) cylinder(h3-4,d/2,d/2);
translate([0,0,h3-2]) cylinder(2,d/2,d/2-2);
translate([0,0,h3]) cylinder(h1,8,8);

}
ecrouM8(15);
cylinder(h1+h3,4.4,4.4);

for(i=[0:1:5])
{
    rotate([0,0,i*360/6]) translate([8+d/2-2,0,0]) cylinder(h3,8,8,$fn=30);
}

}