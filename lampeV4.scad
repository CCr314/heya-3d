// lampe V4
include <secteur.scad>

di=95.6;  // diametre intérieur tube

hf=10; // hauteur bas

hb=7;  // hauteur bouton base carte

dc=81.5;  // diametre carte

lp=15;  // largeur pied support vitre
xp=3;   // epaisseur pied support vitre
dp=86+2*xp;  // diametre exterier pieds

hclip=2.7;
hp=10+hclip;  // hauteur pied support vitre


dv=94;  // diametre vitre
epv=1;  // epaisseur bord transversal vitre
epvf=2;  // epaisseur fond suport vitre vitre
hv=6;

jeu=.5;

alphaUsb=90+20-44;

//translate([0,0,hf+hb])  rotate([180,0,-22]) 
haut();

//bas();
//translate([0,0,12]) decoupeFond();


module haut()
{

    //  pied
    for(i=[0:1:3])
    {
        rotate([0,0,i*360/3]) intersection()
        {
            cylinder(hp,dp/2,dp/2,$fn=100);

            difference()
            {
                union()
                {
                    translate([-lp/2-2,dp/2-xp,0]) cube([lp+4,xp,4]);
                    translate([-lp/2,dp/2-xp,0]) cube([lp,xp,hp-hclip]);
                    
                    hull()
                    {
                        translate([-lp/2+3,dp/2-xp-.8,hp-hclip]) cube([lp-6,xp,.1]);
                        translate([-lp/2,dp/2-xp+.8,hp-hclip]) cube([lp,xp,hclip]);
                    }
                    
                }
                hull()
                {
                    translate([-lp/2,dp/2-2,hp-1]) cube([lp,.5,.1]) ;
                    translate([-lp/2,dp/2-xp-.5,hp-hclip-1]) cube([lp,1.2,.1]) ;
                }
                
           }
        }
    }

    // disque fond vitre
    translate([0,0,0]) difference()
    {
        cylinder(epvf,dv/2,dv/2,$fn=100);
        cylinder(epvf,dv/2-xp-epv,dv/2-xp-epv,$fn=100);
    }
    
    // bord vitre
    translate([0,0,-hv]) difference()
    {
        cylinder(hv,dv/2,dv/2,$fn=100);
        cylinder(hv,dv/2-epv,dv/2-epv,$fn=100);
    }
    /*
    translate([0,0,-hv]) difference()
    {
        ep=3.2;
        cylinder(hv,dv/2-ep,dv/2-ep,$fn=100);
        cylinder(hv,dv/2-epv-ep,dv/2-epv-ep,$fn=100);
        for(i=[0:1:2])
        {
            rotate([0,0,i*360/3]) translate([dv/2-5,-4.5,0]) cube([4,9,hv]);
        }
    }
    */
}

module bas()
{
difference()
{
    union()
    {
        difference()
        {
            cylinder(hf,di/2,di/2,$fn=50);
            cylinder(hf,dc/2,dc/2,$fn=50);
            
            // pieds
            for(i=[0:1:2])
            {
                rotate([0,0,i*360/3+38.5]) intersection()
                {
                    cylinder(hp,dp/2+.5,dp/2+.5,$fn=100);
                    union()
                    {
                        translate([-lp/2-.5,dp/2-xp-.5,0]) cube([lp+2,xp+1,hp+.5]);
                        #translate([-lp/2-3.8,dp/2-10,0]) cube([lp+5,10,5]);
                    }
                }
            }
            //evidement
            for(i=[0:1:2])
            {
                rotate([0,0,i*360/3+22.5]) secteur(hf,di-3,80);
            }
            
        }
        
    // renfort prise Usb

        intersection()
        {
            cylinder(hf,di/2,di/2,$fn=50);
            rotate([0,0,alphaUsb]) translate([dc/2,-20/2,hf-10]) cube([12,20,10]);
        }

        
        // plots vis
        for(i=[0:1:2])
        {
            rotate([0,0,20+i*360/3]) plot();
        }
    }
    // trou prise usb
    rotate([0,0,alphaUsb]) hull()
    {
        //translate([di/2-4,-15/2,hf-9]) cube([5,15,8]);
        translate([di/2-4,-4,hf/2+.5]) rotate([0,90,0]) cylinder(5,4,4,$fn=20);
        translate([di/2-4,4,hf/2+.5]) rotate([0,90,0]) cylinder(5,4,4,$fn=20);
        translate([dc/2-.2,-8/2,hf-9+3.2]) cube([5,8,3]);
    }
    translate([0,0,hf-2]) cylinder(2,dc/2,dc/2,$fn=50);
}

}


module plot()
{
    l=10;
    difference()
    {
        intersection()
        {
            cylinder(hf,dc/2+1,dc/2+1,$fn=50);
            hull()
            {
               translate([-l/2,di/2-3,0])  cube([l,.1,hf]);
                translate([0,33,0])  cylinder(hf,3,3,$fn=20);                
            }   
    } 
     translate([0,32,0])  cylinder(hf,1.35,1.35,$fn=20);
     translate([0,37,0])  cylinder(hf,1.35,1.35,$fn=20);
    }
}

module decoupeFond()
{
ep=3;
    difference()
    {
        cylinder(ep,di/2,di/2,$fnerror=200);
        for(i=[0:1:2])
        {
            rotate([0,0,20+i*360/3]) translate([0,37,0])       cylinder(ep,2.5,2.5,$fn=20);
        }
        
         rotate([0,0,alphaUsb]) translate([-20/2,-20-15/2+3,0])  cube([20,16,ep+.1]);
         rotate([0,0,alphaUsb]) translate([0,20,0])  cylinder(ep,2,2,$fn=20);
    }
}

module decoupeVitre()
{

        cylinder(epv,dv/2-epv-jeu,dv/2-epv-jeu,$fn=200);


}





