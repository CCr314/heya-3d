x=23;
y=16;
z=7;



//ecrou();
butee();

module butee()
{
l=150;
ep=7;
    difference()
    {
        union()
        {
        cube([40,l,ep]);
        cube([ep,l,40]);
        }
        hull()
        {
            translate([12,10,0]) cylinder(ep,4.3,4.3,$fn=20);
            translate([32,10,0]) cylinder(ep,4.3,4.3,$fn=20);

        }
    }
}

module ecrou()
{
    difference()
    {

    cube([x,y,z]);
    translate([x/2,5,0]) cylinder(z,3.8,3.8,$fn=20);
    }
}