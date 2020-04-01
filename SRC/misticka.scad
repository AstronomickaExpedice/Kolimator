$fn=100;
INCH=25.4;

Vytah_prumer=INCH*1.25;    // prumer okularoveho vytahu
Posun_pruzoru=0;          // posun pruzoru pro odecitani ze stupnice
Tloustka_sten=3.2;

// Polomery (osa x,y)
r1=Vytah_prumer/2;      // polomer okularoveho vytahu
r2=r1+3;                // polomer kolimatoru
r3=r1-3.2;    // polomer vzreyu v horni casti kolimatoru
r4=3;                   // polomer pruzoru pro laser
r5=5;                   // polomer dutiny na ulozeni pouzdra diody
r6=10.5+1.5;            // polomer ulozeni baterie
r10=r2-2-2;           //polomer volne plochy (baterie/vicko)
r11=r2-2;             //polomer ulozeni vicka


diameter = 20;          //prumer barerie
thickness = 3;          //tloustka baterie
space = 1;            //mezera mezi baterii a obalkou

holder_width = 10;       //sirka pruzinky
holder_wall = 3;        //tloustka steny
g=20;
delka_pruzinky=25;

module misticka_kolimatoru(){
    difference() {
        cylinder(r=r11-0.5,h=15);
        translate([0,0,4])
            cylinder(r=r11-2-0.5,h=20);
        translate([0,0,2+g/2])
            cube([delka_pruzinky-0.5,10.6,g],center=true);
        translate([0,0,2])
            rotate([0,90,0])
                scale([1,2,1])
                    cylinder(r=0.8,h=delka_pruzinky,center=true);
        translate([8,0,2])
            rotate([0,0,90])
                cylinder(r=1.5,h=delka_pruzinky,center=true);
        
            translate([0,r5,0])
                rotate([0,0,90])
                    cylinder(r=2,h=6,center=true);
        hull() {
            translate([0,r5-1,2])
                    cylinder(r=2,h=6,center=true);
            translate([0,r5+8,5])
                rotate([0,0,0])
                    scale([2,1,2])
                        cylinder(r=1,h=1,center=true);
        /*cylinder(r=diameter/2,h=10);   */
        }
    }
}
echo((r10-2)*2);    
    
    