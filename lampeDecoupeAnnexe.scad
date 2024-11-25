
di=95.6;  // diametre intérieur tube
dv=93; // diametre decoupe vitre
ep=3;

alphaUsb=0; //90+20-44;

<<<<<<< HEAD
projection() decoupeFond();
//projection() decoupeVitre();
=======
//projection() decoupeFond();
//projection() decoupeVitre();

projection() supportPeinture();
>>>>>>> 97d1b8677de46ee80d18b09166d2a0dde53cfb44

module decoupeFond()
{
ep=3;
    difference()
    {
        cylinder(ep,di/2,di/2,$fn=100);
        for(i=[0:1:2])
        {
            rotate([0,0,-1+i*360/3]) translate([0,37,0])       cylinder(ep,2.5,2.5,$fn=100);
        }
        
         rotate([0,0,alphaUsb]) translate([-20/2,-20.5-15/2+2,0])  cube([20,12,ep+.1]);
         rotate([0,0,alphaUsb]) translate([0,19.5,0])  cylinder(ep,2,2,$fn=100);
    }
}


module supportPeinture()
{
l=20;
dv=96;
    difference()
    {
        cylinder(ep,dv/2+.3,dv/2+.3,$fn=200);
        translate([l/2,l/2,0]) cube([dv/2,dv/2,ep]);
        translate([-l/2-dv/2,l/2,0]) cube([dv/2,dv/2,ep]);
        translate([l/2,-l/2-dv/2,0]) cube([dv/2,dv/2,ep]);
        translate([-l/2-dv/2,-l/2-dv/2,0]) cube([dv/2,dv/2,ep]);
        cylinder(ep,4.4,4.4,$fn=20);
    }
}


<<<<<<< HEAD
module supportPeinture()
{

}
=======
>>>>>>> 97d1b8677de46ee80d18b09166d2a0dde53cfb44
