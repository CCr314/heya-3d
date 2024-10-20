// cache prise usb


di=95.6;  // diametre intérieur tube

l=22;
p=8;
h=11.5;

zu=6;
hu1=3.5;
hu2=7;
hu3=8;

lu1=8.5;
lu2=12;
lu3=14;

deaxe=0;

//centreur();
priseLampe();

module centreur()
{
    difference()
    {
    hull()
    {
        trouOblong(20,lu2-.5,hu2/2);
        translate([0,-3,0]) trouOblong(5,lu2-1.5,hu2/2-1);
    }
    translate([0,20-10,0]) rotate([-90,0,0]) cylinder(10,1.2,1.2,$fn=10);

    }
}

module priseLampe()
{

difference()
{

    intersection()
    {
        translate([-l/2,di/2-p,0]) cube([l,p,h]);
       cylinder(h,di/2,di/2,$fn=100); 
    }
    
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