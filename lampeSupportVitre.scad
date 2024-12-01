ep=1.2;
epc=.8;  // epaisseur tour
j=1;

l=14;

dn=95;   // diametre nominal
de=dn-j;
d=de-epc;
di=de-8;

r=41.2;  // Rayon pied de maintien

hp=8.4;
hclip=5;

he=4;  // hauteur epaulement

vitreSupport();
//translate([0,0,2*ep]) rotate([180,0,30]) 
//vitreTour();

module vitreSupport()
{
    difference()
    {
        union()
        {
            cylinder(ep,d/2,d/2,$fn=200);

            intersection()
            {
                union()
                {
                    translate([0,0,ep]) cylinder(2*ep,d/2,di/2+ep,$fn=200);
                    translate([0,0,3*ep]) cylinder(hp+hclip,di/2+ep,r+ep,$fn=200);
                }
                for(i=[0:1:2])
                {
                    rotate([0,0,i*360/3]) translate([0,0,ep]) union()
                    {
                        // pied()
                        hull()
                        {
                            translate([r,-l/2,0]) cube([10,l,.1]);
                            translate([r,-l/2,hp+ep-.1]) cube([4,l,.1]);
                        }
                        
                        // clip
                        translate([r,-l/2,0]) hull()
                        {
                            #translate([-1.5,0,hp+ep]) cube([5,l,.1]);
                            translate([2,0,hp+ep]) cube([8,l,hclip]);
                        }
                        translate([r,-1.5-l/2,0]) cube([8,l+3,he]);  // epaulement pied
                       
                    }

                }
            }
            
            // support tour
            intersection()
            {
                union()
                {
                    anneau(de,di,2*ep);
                    translate([0,0,2*ep]) anneau2(de,di,ep);
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
        translate([0,0,ep]) cylinder(he,di/2,r,$fn=200);
         //translate([0,0,he+ep]) cylinder(hp-he+ep,r,r,$fn=200);        
        anneau(de,d,2*ep);
    }
}

module vitreTour()
{
d=dn;
hv=9.5+ep; //6+ep;
j=0.2;


   // disque haut
    difference()
    {
        cylinder(hv+epc,d/2-j,d/2-j,$fn=200);
        cylinder(hv+.1+epc,d/2-j-epc,d/2-j-epc,$fn=200);
    }
    
    for(i=[0:1:5])
    {
       
        rotate([0,0,i*360/6]) intersection()
        {
            cylinder(hv+epc,d/2-j,d/2-j,$fn=200);
            translate([d/2-j-2,-l/2,0]) cube([2,l,epc]);
            
        }
   }

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
