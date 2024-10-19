// cache prise usb


di=95.6;  // diametre intérieur tube

l=22;
p=8;
h=10;

zu=6;
hu1=3.5;
hu2=7;

lu1=8.5;
lu2=12;

deaxe=0;

difference()
{

    intersection()
    {
        translate([-l/2,di/2-p,0]) cube([l,p,h]);
       cylinder(h,di/2,di/2,$fn=100); 
    }
    
    //translate([deaxe,di/2-p,zu]) trouOblong(lu1,hu1/2);
    translate([deaxe,di/2-p,zu]) trouOblong(lu2,hu2/2);

    
}


module trouOblong(l,r)
{
    hull()
    {
        translate([-l/2+r,0,0]) rotate([-90,0,0]) cylinder(p,r,r,$fn=20);
        translate([l/2-r,0,0]) rotate([-90,0,0]) cylinder(p,r,r,$fn=20);
    }

}