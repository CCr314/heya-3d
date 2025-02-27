// bouton dessous

decal=1;   // 2 pour station, 0 pour lampe

difference()
{
    union()
    {
        translate([-3,-5,0]) cuber([6,10,4+3],1.5);
        translate([-15,-7.5,0]) cube([30,15,4]);
    }
    translate([-2.3/2,-2.3/2+decal,0]) cube([2.3,2.3,4+3.8]);
    
    // rainure
    translate([-15,-4.8/2+decal,0]) cube([30,4.8,3]);
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