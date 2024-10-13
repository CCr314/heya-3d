// lampe decoupe

d=95.7;

ep1=3;
ep2=6;

decoupe(false);

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
        translate([-30,12,-.1]) cube([10,7,ep+.2]);
        
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
            rotate([0,0,90+45]) translate([-17,17,-.1]) cube([27,20,ep+.2]);
        }
        
        
        for(i=[0:1:2])
        {
            // pieds vitre
            if(bas)
                rotate([0,0,-40+i*360/3]) translate([-16/2,40,-.1]) cube([16,8,ep+.2]); 
            else
                rotate([0,0,-40+i*360/3]) translate([-16/2,43,-.1]) cube([16,5,ep+.2]); 
                
            // trou fond boitier
            rotate([0,0,-0+i*360/3]) translate([37,0,-.1]) cylinder(ep+.2,1.2,1.2,$fn=10); 
            // trou carte
            rotate([0,0,45+i*360/3]) translate([32,0,-.1]) cylinder(ep+.2,1.2,1.2,$fn=10); 
        }
        
        // trou fond
        
        
    }
}