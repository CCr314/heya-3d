d=100.3;

ep=2;
epc=1.2;

h=8;


difference()
{
cylinder(ep+h,d/2+epc,d/2+epc,$fn=100);
cylinder(h,d/2,d/2,$fn=100);
cylinder(2,d/2+2,d/2,$fn=100);
cylinder(ep+h,4.2,4.2,$fn=20);

intersection()
{
cylinder(h+ep,d/2,d/2,$fn=100);
for(i=[0:1:3])
{
    rotate([0,0,i*360/4]) translate([7,7,0]) cube([d/2,d/2,h+ep+.1]);
}
}
}