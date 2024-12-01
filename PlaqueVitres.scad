xp=598;
yp=496;

d=96;

ep=3;

j=3;

difference()
{
    cube([xp,yp,ep]);
    
    
    for(l=[0:1:4])
    {
    for(c=[0:1:5])
    {
        translate([c*(d+j)+(d+j)/2,l*(d+j)+(d+j)/2,-.1]) cylinder(ep+.2,d/2,d/2,$fn=30);
    }
    }
   /* 
    for(l=[0:1:2])
    {
    for(c=[0:1:4])
    {
         translate([c*(d+j)+d+j,l*2*(d*.88)+d*.88+(d+j)/2,-.1]) cylinder(ep+.2,d/2,d/2,$fn=30);
    }
    }
    
    */
}