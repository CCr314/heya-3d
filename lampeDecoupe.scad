// lampe decoupe

d=96;

ep1=3;
ep2=6;

//projection() decoupe(false);
//translate([0,0,5])

//projection()
// decoupe(false);

 
projection()
 decoupe(false);

//supportVitre();

//fixeVitre();

module supportVitre()
{
j=0.2;
hclip=5;
hp=7.8+2.5; 
ep=.8;
epf=1.5;
l=15;
r=40.5;
hv=0; //2.8;

    // disque haut
    difference()
    {
        cylinder(hv+epf,d/2-j-ep,d/2-j-ep,$fn=200);
        translate([0,0,-.1]) cylinder(hv+.1,d/2-j-ep,d/2-j-ep,$fn=200);
        cylinder(hv+epf+.1,d/2-j-4,d/2-j-4,$fn=200);
    }
    
    // pieds
    intersection()
    {
        translate([0,0,hv+epf]) cylinder(hp+hclip,d/2-j,d/2-j-5,$fn=200);
        difference()
        {
            union()
            {
            for(i=[0:1:2])
            {
               
                rotate([0,0,i*360/3]) translate([r+.5,-l/2,hv]) union()
                {
                    cube([8,l,hp]);
                    #translate([0,-1.5,0]) cube([8,l+3,4.2+1.6]);  // epaulement pied
                    hull()
                    {
                        translate([-1.8,0,hp]) cube([9.5,l,.1]);
                        #translate([1,0,hp]) cube([8,l,hclip]);
                    }
                    
                }
           }
           
           // renfort intermediaire
            difference()
            {
                for(i=[0:1:2])
                {
                   
                    rotate([0,0,i*360/3+360/6]) translate([r+.5,-l/2,hv]) 
                        cube([8,l,2*ep+epf]);
               }
               
               // disque interieur
               cylinder(2*ep+epf+hv,d/2-j-4,d/2-j-4,$fn=200);
               
               difference()
               {
                cylinder(ep+epf+hv,d/2-j+ep,d/2-j+ep,$fn=200);
                cylinder(ep+epf+hv,d/2-j-ep,d/2-j-ep,$fn=200);
               }
           }
       }
           
           hull()
           {
               translate([0,0,hv-.1]) cylinder(epf,d/2-j-4,d/2-j-4,$fn=200);
               for(i=[0:1:2])
                {
               
                rotate([0,0,i*360/3]) translate([0,-l/2,hv+hp-2])  cube([r+.5,l,2]);
                }
             
           }
        }
    }
    


}

module fixeVitre()
{
hv=3;
j=0.2;
hclip=5;
hp=7.8+2.5; 
ep=.8;
epf=1.5;
l=15;
r=40.5;

   // disque haut
    difference()
    {
        cylinder(hv+epf+ep,d/2-j,d/2-j,$fn=200);
        cylinder(hv+epf+.1+ep,d/2-j-ep,d/2-j-ep,$fn=200);
    }
    
    for(i=[0:1:5])
    {
       
        rotate([0,0,i*360/6]) intersection()
        {
            cylinder(hv+epf+ep,d/2-j,d/2-j,$fn=200);
            translate([d/2-j-2,-l/2,0]) cube([2,l,ep]);
            
        }
   }

}


module supportVitreSav()
{
j=0.2;
hclip=5;
hp=7.8+2.5; 
ep=.8;
epf=1.5;
l=15;
r=40.5;
hv=2.8;

    // disque haut
    difference()
    {
        cylinder(hv+epf,d/2-j,d/2-j,$fn=200);
        translate([0,0,-.1]) cylinder(hv+.1,d/2-j-ep,d/2-j-ep,$fn=200);
        cylinder(hv+epf+.1,d/2-j-4,d/2-j-4,$fn=200);
    }
    
    // pieds
    intersection()
    {
        translate([0,0,hv]) cylinder(hp+hclip,d/2-j-.5,d/2-j-5,$fn=200);
        difference()
        {
            for(i=[0:1:2])
            {
               
                rotate([0,0,i*360/3]) translate([r+.5,-l/2,hv]) union()
                {
                    cube([8,l,hp]);
                    translate([0,-1.5,0]) cube([8,l+3,4.2+1.6]);  // epaulement pied
                    hull()
                    {
                        translate([-1.8,0,hp]) cube([9.5,l,.1]);
                        translate([1,0,hp]) cube([8,l,hclip]);
                    }
                    
                }
           }
           
           hull()
           {
               translate([0,0,hv-.1]) cylinder(epf,d/2-j-4,d/2-j-4,$fn=200);
               for(i=[0:1:2])
                {
               
                rotate([0,0,i*360/3]) translate([0,-l/2,hv+hp-2])  cube([r+.5,l,2]);
                }
             
           }
        }
    }
    


}

module decoupe(bas)
{
    ep=bas?ep2:ep1;

    difference()
    {
        cylinder(ep,d/2,d/2,$fn=100);
        
        // module usb
        translate([-16/2,16,-.1]) cube([16,32,ep+.2]);
        if(bas)
        {
            translate([-22/2,16+12,-.1]) cube([22,32,ep+.2]);
            translate([-22/2,d/2-8+2,-.1]) cylinder(ep+.2,2.2,2.2,$fn=20);
            translate([22/2,d/2-8+2,-.1]) cylinder(ep+.2,2.2,2.2,$fn=20);
        }
        else
        {
            translate([-22/2,16,-.1]) cube([22,32,ep+.2]);
        }
        
        if(bas)
            translate([0,14,-.1]) cube([16,15,ep+.2]);
        else
            translate([0,14,-.1]) cube([20,18,ep+.2]);
        
        //translate([-7,-12,-.1]) cube([8,30,ep+.2]);
        
        //translate([-32,22,-.1]) cube([30,6,ep+.2]);
        
        
        // composants droite
        translate([4,-28,-.1]) hull()
        {
            cube([20,36,ep+.2]);
            translate([0,8,0]) cube([28,28,ep+.2]);
        }
        
        // resistance droite
        translate([25,8,-.1]) cube([10,12,ep+.2]);
        
        // passageCable
        if(!bas)
        {
        #translate([20,14,-.1]) cube([10,3,ep+.2]);
        }
        
        // resistance gauche
        translate([-32,11,-.1]) cube([10,7,ep+.2]);
        
        // antenne
        translate([-9,-18-22,-.1]) cube([9,22,ep+.2]);
        
        // inter
        if(bas)
          translate([-28,-18,-.1]) cube([16,38,ep+.2]);

        else
            translate([-28,-15,-.1]) cube([18,27,ep+.2]);
        
        // Lora
        if(!bas)
        {
            rotate([0,0,90+45]) translate([-17,17,-.1]) cube([27,22,ep+.2]);
        }
        
        
        for(i=[0:1:2])
        {
            // pieds vitre
            if(bas)
                rotate([0,0,-40+i*360/3]) translate([-16/2,38,-.1]) cube([16,10,ep+.2]); 
            else
                rotate([0,0,-40+i*360/3]) translate([-16/2,41,-.1]) cube([16,7,ep+.2]); 
                
            // trou fond boitier
            rotate([0,0,-0+i*360/3]) translate([37,0,-.1]) cylinder(ep+.2,1.2,1.2,$fn=10); 
            // trou carte
            rotate([0,0,45+i*360/3]) translate([32.6,0,-.1]) cylinder(ep+.2,1.2,1.2,$fn=10); 
        }
        
    }
}