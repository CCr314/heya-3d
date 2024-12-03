h1=1;
h2=3;

d1=15;
d2=12.7;

d3=8.4;

difference()
{
union()
{
cylinder(h1,d1/2,d1/2,$fn=20);
cylinder(h2,d2/2,d2/2,$fn=20);
translate([0,0,h2]) cylinder(1,d2/2,d2/2-1,$fn=20);
}
cylinder(h2+2,d3/2,d3/2,$fn=20);
cylinder(1,d3/2+1,d3/2,$fn=20);
translate([0,0,h2]) cylinder(1,d3/2,d3/2+1,$fn=20);
}
