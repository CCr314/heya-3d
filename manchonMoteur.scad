// axe moteur peinture

support();

module support()
{
ep=3;

d1=12;
d3=37;
daxe=7;

dv=31;

x=50;
z=18;

difference()
{
    cylinder(ep,d3/2,d3/2,$fn=20);
    translate([0,daxe,0]) cylinder(ep,d1/2,d1/2,$fn=20);
    for(i=[0:1:5])
        rotate([0,0,i*360/6]) translate([dv/2,0,0]) cylinder(ep,1.7,1.7,$fn=20);
}

translate([-x/2,-10,0]) cube([x,ep,z]);


}



module manchon()
{

d1=6;
d2=6.75;

h1=12;
h2=12;

de=14;

c=5.6;


difference()
{
    cylinder(h1+h2,de/2,de/2,$fn=20);
    cylinder(h1,d1/2,d1/2,$fn=20);
    translate([0,0,h1]) cylinder(h2,d2/2,d2/2,$fn=20);
} 
intersection()
{
    cylinder(h1,de/2,de/2,$fn=20);
    translate([c-d1/2,-de/2,0]) cube([de,de,h1]);
}

}