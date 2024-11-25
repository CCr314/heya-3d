
di=95.6;  // diametre intérieur tube
dv=93; // diametre decoupe vitre
ep=3;

alphaUsb=90+20-44;

projection() decoupeFond();
//projection() decoupeVitre();

module decoupeFond()
{
ep=3;
    difference()
    {
        cylinder(ep,di/2,di/2,$fn=100);
        for(i=[0:1:2])
        {
            rotate([0,0,20+i*360/3]) translate([0,37,0])       cylinder(ep,2.5,2.5,$fn=100);
        }
        
         rotate([0,0,alphaUsb]) translate([-20/2,-20-15/2+2,0])  cube([20,12,ep+.1]);
         rotate([0,0,alphaUsb]) translate([0,20,0])  cylinder(ep,2,2,$fn=100);
    }
}


module decoupeVitre()
{
        cylinder(ep,dv/2,dv/2,$fn=200);
}


module supportPeinture()
{

}