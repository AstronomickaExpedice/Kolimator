$fn=100;
INCH=25.4;

Vytah_prumer=INCH*1.25;    // prumer okularoveho vytahu
Posun_pruzoru=0;          // posun pruzoru pro odecitani ze stupnice
Tloustka_sten=3.2;

//Rozmery sroubu a matky pro M3 [mm]
M3_screw_diameter = 3.2;                //prumer sroubu (zavit)
M3_screw_head_height = 3;               //vyska hlavy sroubu
M3_nut_height = 2.7;                    //vyska matky
M3_nut_diameter = 6.6;                  //prumer matky (kruznice opsana)
M3_screw_head_diameter = 6.6;           //prumer hlavy sroubu

// Polomery (osa x,y)
r1=Vytah_prumer/2;      // polomer okularoveho vytahu
r2=r1+3;                // polomer kolimatoru
r3=r1-3.2;    // polomer vzreyu v horni casti kolimatoru
r4=3;                   // polomer pruzoru pro laser
r5=11;                   // polomer dutiny na ulozeni pouzdra diody
r6=10.5+1.5;            // polomer ulozeni baterie
r10=r2-2-2;           //polomer volne plochy (baterie/vicko)
r11=r2-2;             //polomer ulozeni vicka


diameter = 20;          //prumer barerie
thickness = 3;          //tloustka baterie
space = 1;            //mezera mezi baterii a obalkou

holder_width = 10;       //sirka pruzinky
holder_wall = 3;        //tloustka steny


module pruzinka(){
    difference() {
        translate([0,0.3,0]) {
            union() {
                union() {
                    difference(){
                        translate([0,0,0])    
                        cube([thickness+holder_wall*2+space*2, diameter+holder_wall+1, holder_width], center=true);
                         
                        translate([0, -holder_wall/2-7+3, 0])
                            cube([thickness+space*3, diameter+10, holder_width+0.1], center=true);
                        
                        
                        hull() {
                            translate([thickness/2+space+holder_wall-0.3, -diameter/2 - space-4+3, 0])
                                cube([0.6,1.2,1],center=true);
                            translate([thickness/2+space+holder_wall-0.3, 6+3-1, 0])
                                cube([0.6,1.2,1],center=true);  
                        }
                        hull() {
                            translate([-thickness/2-space-holder_wall+0.3, -diameter/2 - space-4+3, 0])
                                cube([0.6,1.2,1],center=true);
                            translate([-thickness/2-space-holder_wall+0.3, 6+3-1, 0])
                                cube([0.6,1.2,1],center=true);  
                        }
                        translate([0, 8.7, 0])
                            rotate([0, 90, 0])
                                cylinder(d=1.5, h=20, center = true, $fn=100);
                            
                        
                        
                    }
                    

                    difference() {
                        hull(){
                            translate([thickness, -diameter/2 - space, 0])        
                                cube([1, 1, holder_width],center=true);           
                            translate([1, 5+3-1, 0])       
                                cube([1, 1, holder_width],center=true);       
                        }


                        hull() {
                            translate([thickness-0.3, -diameter/2 - space-1, 0])
                                cube([0.4,1.2,1],center=true);
                            translate([0.7, 5+3-1, 0])
                                cube([0.4,1.2,1],center=true);     
                        }        
                    }      

                    difference() {        
                        hull(){
                            translate([-thickness, -diameter/2 - space, 0])
                                cube([1, 1, holder_width],center=true);
                            translate([-1, 5+3-1, 0])
                                cube([1, 1, holder_width],center=true);
                        }


                        hull() {
                            translate([-thickness+0.3, -diameter/2 - space-1, 0])
                                cube([0.4,1.2,1],center=true);
                            translate([-0.7, 5+3-1, 0])
                                cube([0.4,1.2,1],center=true);
                                
                        }        
                    }
                }
            
                difference() {
                    translate([0,-diameter/2-1.5,0])
                        cube([11,2,10],center=true);
                    #translate([0,-diameter/2-2,0])
                        cube([15,4,1],center=true);
                    #translate([0,-diameter/2-2,0])
                        rotate([0,90,0])
                            cube([15,4,thickness],center=true);
            }
        }    
    }
    rotate([0,90,0])  {  
        difference() {
        
            cylinder(r=20,h=20,center=true);
            cylinder(r=r11-1-2-1,h=20,center=true);
        }
    }
     }
 }     
echo(space*2+diameter+thickness*2);


