ep=1.2;
epc=.8;  // epaisseur tour
j=1;

l=14;

de=96-j;
d=de-epc;
di=de-8;

r=41;  // Rayon pied de maintien

hp=8.2;
hclip=5;

difference()
{
    union()
    {
        cylinder(ep,d/2,d/2,$fn=200);

        
        intersection()
        {
            translate([0,0,ep]) cylinder(hp+hclip,d/2,de/2-5.5,$fn=200);
            for(i=[0:1:2])
            {
                rotate([0,0,i*360/3]) translate([0,0,ep]) union()
                {
                    // pied()
                    hull()
                    {
                        translate([di/2-1,-l/2,0]) cube([5,l,.1]);
                        translate([r,-l/2,hp+ep-.1]) cube([4,l,.1]);
                    }
                    
                    // clip
                    translate([r,-l/2,0]) hull()
                    {
                        translate([-2.5,0,hp+ep]) cube([5,l,.1]);
                        translate([1,0,hp+ep]) cube([8,l,hclip]);
                    }
                    translate([r,-2-l/2,0]) cube([8,l+4,4.5]);  // epaulement pied
                }

            }
        }
        
        // support tour
        intersection()
        {
            union()
            {
                anneau(de,di,2*ep);
                translate([0,0,2*ep]) anneau2(de+.4,di,ep);
            }
            //cylinder(hp+hclip,de/2,de/2,$fn=200);
            for(i=[0:1:5])
            {
                rotate([0,0,i*360/6]) translate([0,-l/2,2*ep]) cube([de/2,l,ep]);
                rotate([0,0,i*360/6]) translate([0,-l/2,ep]) cube([d/2,l,ep]);
            }
        }
    }
    translate([0,0,-.1]) cylinder(ep+.2,di/2,di/2,$fn=200);
    translate([0,0,ep]) cylinder(hp+ep,di/2,r,$fn=200);
    
    anneau(de,d,2*ep);
}

module anneau(de,di,ep)
{
    difference()
    {
        cylinder(ep,de/2,de/2,$fn=200);
        translate([0,0,-.1]) cylinder(ep+.2,di/2,di/2,$fn=200);
        
    }
}

module anneau2(de,di,ep)
{
    difference()
    {
        cylinder(ep,de/2,de/2-ep,$fn=200);
        translate([0,0,-.1]) cylinder(ep+.2,di/2,di/2,$fn=200);
        
    }
}