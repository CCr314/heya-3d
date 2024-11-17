// cache prise usb


di=95.4;  // diametre intérieur tube

l=22;
p=8.5;
h=11.5;

zu=6;
hu1=3.5;
hu2=7;
hu3=8;

lu1=8.5;
lu2=12;
lu3=14;

deaxe=0;

//translate([deaxe,di/2-p,zu]) */ centreur();
priseLampe();

module centreur()
{
    difference()
    {
    hull()
    {
        translate([0,-p,0]) trouOblong(p,lu2,hu2/2);
        translate([0,0,0]) trouOblong(p,lu3,hu3/2);
    }
    translate([0,p,0]) rotate([-90,0,0]) cylinder(10,1.2,1.2,$fn=10);

    }
}

module priseLampe()
{

difference()
{
    union()
    {
        intersection()
        {
           translate([-l/2,di/2-p,0]) cuber([l,p,h],7);
           cylinder(h,di/2,di/2,$fn=100); 
        }
        translate([-l/2,di/2-p+2+1,0]) cylinder(5.6,2.2,2,$fn=20);
        translate([l/2,di/2-p+2+1,0]) cylinder(5.6,2.2,2,$fn=20);
    }
    //#translate([-l/2,di/2-p,h-1]) rotate([7,0,0]) cube([l,p,h]) ;
    //translate([0,0,h-3]) cylinder(3,39,40,$fn=100);
    //translate([deaxe,di/2-p,zu]) trouOblong(p,lu1,hu1/2);
    hull()
    {
        translate([deaxe,di/2-p,zu]) trouOblong(p,lu2,hu2/2);
        translate([deaxe,di/2,zu]) trouOblong(p,lu3,hu3/2);
    }
    
}
}

module trouOblong(p,l,r)
{
    hull()
    {
        translate([-l/2+r,0,0]) rotate([-90,0,0]) cylinder(p,r,r,$fn=20);
        translate([l/2-r,0,0]) rotate([-90,0,0]) cylinder(p,r,r,$fn=20);
    }

}


module cuber(dim,r)
{
hull()
{
    cube([dim.x,dim.y,.1]);
    translate([r,0,dim.z-r]) rotate([-90,0,0]) cylinder(dim.y,r,r,$fn=20);
    translate([dim.x-r,0,dim.z-r]) rotate([-90,0,0]) cylinder(dim.y,r,r,$fn=20);
    }
}