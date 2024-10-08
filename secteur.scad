//secteur


module secteur(h,d,alpha,pas=2)
{
    c=sin(pas)*d/2;
    
    hull()
    {
        cube([.1,.1,h]);
        for(i=[0:pas:alpha])
        {
            rotate([0,0,i+pas/2]) translate([d/2-.1,-c/2,0]) cube([.1,c,h]);
        }
    }
}
