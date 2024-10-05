// bouton dessous

difference()
{
    union()
    {
        translate([-2,-7.5,0]) cuber([4,15,4.8],1.5);
        translate([-15,-10,0]) cube([30,20,1]);
    }
    translate([-1,-1,0]) cube([2.3,2.3,5]);
}

module cuber(dim,r)
{
    hull()
    {
        cube([dim.x,dim.y,.1]);
        translate([r,r,dim.z-r]) sphere(r,$fn=15);
        translate([dim.x-r,r,dim.z-r]) sphere(r,$fn=15);
        translate([r,dim.y-r,dim.z-r]) sphere(r,$fn=15);
        translate([dim.x-r,dim.y-r,dim.z-r]) sphere(r,$fn=15);
    }
}