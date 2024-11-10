d=10.4;
h=16;

cylinder(2,d/2-1,d/2,$fn=20);
translate([0,0,2]) cylinder(h-4,d/2,d/2,$fn=20);
translate([0,0,h-2]) cylinder(2,d/2,d/2-1,$fn=20);
