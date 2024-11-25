
calePmma();

module calePmma()
{
difference()
{

l=40;

anneau(98,96,7);
for(i=[0:1:5])
    rotate([0,0,i*360/6]) translate([96/2-5,-l/2,2]) cube([10,l,7]);
}

}

module anneau(de,di,ep)
{
    difference()
    {
        cylinder(ep,de/2,de/2,$fn=200);
        translate([0,0,-.1]) cylinder(ep+.2,di/2,di/2,$fn=200);
        
    }
}


module calePMMA2()
{
    cylinder(2,1.5,1.5,$fn=20);
    translate([0,0,2]) hull()
    {
        cylinder(1,2,2,$fn=20);
        translate([1,-1,4.9]) cube([1,2,.1]); 
    }

}


module rehausseCarte()
{
    anneau(6,3.2,2);
}