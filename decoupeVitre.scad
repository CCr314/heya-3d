ep=3;

d=96;
jeu=3;

difference()
{
    cube([800,500,ep]);
    serie1(d/2+jeu);
    serie2(d+d/2-7);
    serie1(d+d+d/2-18);
    serie2(d+d+d+d/2-18-7);
    serie1(d+d+d+d+d/2-18-18);
    
}

module serie1(yo)
{
    for(x=[d/2+jeu:d+jeu:800-d/2-jeu])
    {
        translate([x,yo,-.1]) cylinder(ep+.2,d/2,d/2,$fn=200);
    }
}

module serie2(yo)
{
    xo=d+6;
    //yo=d+d/2-7;
    for(x=[xo:d+jeu:800-d/2-jeu])
    {
        translate([x,yo,-.1]) cylinder(ep+.2,d/2,d/2,$fn=200);
    }
    
}