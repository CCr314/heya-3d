// lampe decoupe

d=96;

ep1=3;
ep2=6;

//projection()
//gabaritCollage();


translate([0,0,0]) decoupe(true,false);
translate([0,0,20]) decoupe(false);
translate([0,0,-60]) decoupeFond();


translate([0,0,-40]) difference()
{
    cylinder(29,50,50,$fn=200);
    cylinder(29,d/2,d/2,$fn=200);
    translate([0,d/2-2,9]) rotate([-90,0,0]) hull()
    {
        translate([-2.5,0,0]) cylinder(10,4,4,$fn=20);
        translate([2.5,0,0]) cylinder(10,4,4,$fn=20);
    }
}
 
module decoupe(bas,test=false)
{
    ep=bas?ep2:ep1;

    difference()
    {
        if(bas)
            cylinder(ep,d/2,d/2,$fn=100);
        else
            cylinder(ep,d/2-1,d/2-1,$fn=100);
        
        // module usb
        yusb=32;
        translate([-16/2,16,-.1]) cube([16,yusb,ep+.2]);
        if(bas||test)
        {
            translate([-22/2,16+12,-.1]) cube([22,yusb,ep+.2]);
            translate([-22/2,d/2-8+2,-.1]) cylinder(ep+.2,2.2,2.2,$fn=20);
            translate([22/2,d/2-8+2,-.1]) cylinder(ep+.2,2.2,2.2,$fn=20);
        }
        else
        {
            translate([-22/2,16,-.1]) cube([22,32,ep+.2]);
        }

        
        if(bas|| test)
            translate([0,14,-.1]) cube([16,15,ep+.2]);
        else
            translate([0,14,-.1]) cube([20,18,ep+.2]);
        
        //translate([-7,-12,-.1]) cube([8,30,ep+.2]);
        
        //translate([-32,22,-.1]) cube([30,6,ep+.2]);
        
        
        // composants droite
        translate([8,-8,0]) cube([25,16,ep+.2]);
        translate([4,-28,-.1]) hull()
        {  
           translate([0,0,0]) cube([18,14,ep+.2]);
           translate([0,8,0]) cube([29,12,ep+.2]);
        }
        
        // resistance droite
        translate([25,8,-.1]) cube([8,12,ep+.2]);
        
        // passageCable
        if(!bas&&!test)
        {
        //translate([20,14,-.1])
        cube([30,20,ep+.2]);
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
            if(test)
                rotate([0,0,24-40+i*360/3]) union()
                {
                    translate([-18/2,38,-.1]) cube([18,10,ep+.2]); 
                    translate([-18/2,41,-.1]) cube([25,10,ep+.2]); 
                    }

            
            // trou fond boitier
            rotate([0,0,-0+i*360/3]) translate([37,0,-.1]) cylinder(ep+.2,1.2,1.2,$fn=10); 
            // trou carte
            rotate([0,0,45+i*360/3]) translate([32.6,0,-.1]) cylinder(ep+.2,1.2,1.2,$fn=10); 
            

        }
        
        //gorges pour colle
        nb=24;
        if(bas) for(i=[0:1:nb-1])
        {
            
               rotate([0,0,35+i*360/nb]) translate([0,d/2+.5,-.1]) cylinder(ep+.2,2,2,$fn=20);
        }
        
        // trou pour support peinture
        translate([0,0,-.1]) cylinder(ep+.2,4.4,4.4,$fn=20);
        
    }
}


module gabaritCollage()
{
    ep=ep1;

    difference()
    {
        cylinder(ep,d/2+4,d/2+4,$fn=100);       
        
        for(i=[0:1:2])
        {
            // pieds vitre
            rotate([0,0,-40+i*360/3]) translate([-16/2-1,41,-.1]) hull()
            {
                cube([.1,3,ep+.2]); 
               cube([16+1,2.8,ep+.2]);
            }
            rotate([0,0,24-40+i*360/3]) union()
            {
                translate([-18/2,38,-.1]) cube([18,6,ep+.2]); 
                translate([-18/2,41,-.1]) cube([20,6,ep+.2]); 
            }            
           rotate([0,0,24-40+i*360/3]) hull()
            {
                translate([18/2-5,40,-.1]) cube([11,.1,ep+.2]); 
               translate([18/2-5,38,-.1]) cube([5,2,ep+.2]); 
            }            

        }
        
    }
}

module decoupeFond()
{
ep=3;
di=95.2;  // diametre intérieur tube

    difference()
    {
        cylinder(ep,di/2,di/2,$fn=100);
        for(i=[0:1:2])
        {
            rotate([0,0,-1+i*360/3]) translate([0,37,0])       cylinder(ep,2.5,2.5,$fn=100);
        }
        
         translate([-20/2,-20.5-15/2+2,0])  cube([20,12,ep+.1]);
         translate([0,19.5,0])  cylinder(ep,2,2,$fn=100);
    }
}

