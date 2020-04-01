use <telo.scad>


module sroubek(delka = 10){
   
    translate([0, 0, -3]) cylinder(d=5.5, h = 3, $fn=20);
    cylinder(h = delka, d = 3, $fn=20);
    
}




color("red")
translate([16+5, -0, 55.5])
rotate([0,-90, 0])
        sroubek(16);

difference(){
    union(){
        telo_kolimatoru();
    }
    
    
    
    cube(200);
}