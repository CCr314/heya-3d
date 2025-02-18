// centreurs
h=18;
r=5.15;

cylinder(2,4,r,$fn=30);
translate([0,0,2]) cylinder(h-4,r,r,$fn=30);
translate([0,0,h-2]) cylinder(2,r,4,$fn=30);
