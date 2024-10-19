// lampe decoupe

d=95.7;

ep1=3;
ep2=6;

//projection() decoupe(false);
//translate([0,0,5])
projection()
 decoupe(true);


//supportVitre();

module supportVitre()
{
j=0.3;
hclip=2.7;
hp=7.8; 
ep=.8;
l=15;
r=41;

    // disque haut
    difference()
    {
        cylinder(8,d/2-j,d/2-j,$fn=200);
        translate([0,0,-.1]) cylinder(8-ep+.1,d/2-j-ep,d/2-j-ep,$fn=200);
        cylinder(8+.1,d/2-j-4,d/2-j-4,$fn=200);
    }
    
    // pieds
    intersection()
    {
        cylinder(8+hp+hclip,d/2-j-.5,d/2-j-.5,$fn=200);
        difference()
        {
            for(i=[0:1:2])
            {
               
                rotate([0,0,i*360/3]) translate([r+.5,-l/2,8]) union()
                {
                    cube([8,l,hp]);
                    translate([0,-2,0]) cube([8,l+4,3.5]);  // epaulement pied
                    hull()
                    {
                        translate([-1.5,0,hp]) cube([9.5,l,.1]);
                        translate([2,0,hp])cube([8,l,hclip]);
                    }
                    
                }
           }
           
           hull()
           {
               translate([0,0,8-.1]) cylinder(.2,d/2-j-4,d/2-j-4,$fn=200);
               for(i=[0:1:2])
                {
               
                rotate([0,0,i*360/3]) translate([0,-l/2,8+hp-2])  cube([r+.5,l,2]);
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
            translate([-22/2,16+15,-.1]) cube([22,32,ep+.2]);
        else
            translate([-22/2,16,-.1]) cube([22,32,ep+.2]);
        
        // composants droite
        translate([4,-28,-.1]) cube([28,36,ep+.2]);
        
        // resistance droite
        translate([25,12,-.1]) cube([10,7,ep+.2]);
        
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