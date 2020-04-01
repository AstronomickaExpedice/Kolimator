use <telo.scad>
use <vicko.scad>

module sroubek(delka = 10){
   
    translate([0, 0, -3]) cylinder(d=5.5, h = 3, $fn=20);
    cylinder(h = delka, d = 3, $fn=20);
    
}




color("red")
translate([-12, 0, 39])
rotate([0,90, 0])
        sroubek(10);

color("red")
translate([-18, 0, 5])
rotate([0,90, 0])
        sroubek(6);


difference(){
    union(){
        telo_kolimatoru();
        color("green")
        translate([0,0,-6])
            vicko_kolimatoru();
    }
    
    
    translate([-200,0,-10])
    cube(200);
}