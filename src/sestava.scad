use <telo.scad>
use <vicko.scad>
use <ulozeni_laseru.scad>
use <misticka.scad>
use <pruzinka.scad>

module sroubek(delka = 10){
   
    translate([0, 0, -3]) cylinder(d=5.5, h = 3, $fn=20);
    cylinder(h = delka, d = 3, $fn=20);
    
}




color("red")
translate([-12, 0, 39])
rotate([0,90, 0])
        sroubek(10);

color("Red")
translate([-18, 0, 5])
rotate([0,90, 0])
        sroubek(6);


difference(){
    union(){
        telo_kolimatoru();
        
        color("Green")
        translate([0,0,-6])
            vicko_kolimatoru();
        
        color ("LightGreen")
        translate([0,0,45])
        rotate([0,180,0])
        ulozeni_laseru();
        
        color("Orange")
        translate([0,0,30])
        rotate([0,180,0])
        misticka_kolimatoru();
        
        color("LightBlue")
        translate([0,0,23])
        rotate([0,90,90])
        pruzinka();
    }
    
    
    translate([-200,0,-10])
    cube(200);
}