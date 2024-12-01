

ep=4;

jauge=29.5;

difference()
{
hull()
{
    cube([jauge+4,ep,ep]);
   translate([0,10,0]) cube([jauge,ep,ep]);
   }
   translate([2,0,0]) cube([jauge,2,ep]);
   }