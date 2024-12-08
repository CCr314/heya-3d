// axe moteur peinture

//support();
//manchon();

outilTarraud();

//axe();
//roulement();

module roulement()
{
roulement=11.1;
r=14;

h1=7;
h2=10;
x=50;


    difference()
    {
        union()
        {
         hull()
         {
         cylinder(h2,r,r,$fn=20);
         #translate([-r-2,-14,0]) cube([2*r+4,3,h2]);
         }
         translate([-x/2,-14,0]) cube([x,3,h2]);

        }
        translate([0,0,h2-h1]) cylinder(h1,roulement,roulement,$fn=20);
        cylinder(h2,roulement-2,roulement-2,$fn=20);
    
    #translate([-20,-14,5]) rotate([-90,0,0]) cylinder(3,2.2,2.2,$fn=20);
    #translate([20,-14,5]) rotate([-90,0,0]) cylinder(3,2.2,2.2,$fn=20);
}
}


module axe()
{
d2=7;

    difference()
    {
        cannele(11.6,13.6,14,6,2.6);
        cylinder(14,d2/2,d2/2,$fn=20);
    }
}


module support()
{
ep=5;

d1=14;
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
difference()
{
translate([-x/2,-10,0]) cube([x,3,z]);
#translate([-20,-10,12]) rotate([-90,0,0]) cylinder(3,2.2,2.2,$fn=20);
#translate([20,-10,12]) rotate([-90,0,0]) cylinder(3,2.2,2.2,$fn=20);
}
}



module manchon()
{

d1=6;
d2=6.75;

h1=12;
h2=12;

de=18;

c=5.6;


difference()
{
    cylinder(h1+h2,de/2,de/2,$fn=20);
    cylinder(h1,d1/2,d1/2,$fn=20);
    translate([0,0,h1]) cannele(12.4,14.4,20,6,3.4);//cylinder(h2,d2/2,d2/2,$fn=20);
} 
intersection()
{
    cylinder(h1,de/2,de/2,$fn=20);
    translate([c-d1/2,-de/2,0]) cube([de,de,h1]);
}

}

module outilTarraud()
{
d1=6;
d2=6.75;

h1=12;
h2=12;

de=18;

c=5.6;


difference()
{
    translate([-de/2,-de/2,0]) cube([de,de,h1]);
    //cylinder(h1,de/2,de/2,$fn=20);
    //cylinder(h1,d1/2,d1/2,$fn=20);
    cannele(12.4,14.4,20,6,3.4);
} 
}

module cannele(di,de,h,n,c)
{
    cylinder(h,di/2,di/2,$fn=30);
    
    intersection()
    {
        cylinder(h,de/2,de/2,$fn=30);
        for(i=[0:1:n-1])
            rotate([0,0,i*360/n]) translate([di/2-1,-c/2,0]) cube([de/2-di/2+c,c,h]);
    }
    
}
