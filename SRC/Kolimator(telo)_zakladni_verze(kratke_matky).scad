// CSG.scad - Basic example of CSG usage
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

// Polomery (rovina x,y)
r7=M3_nut_diameter/2;         // polomer matky
r8=M3_screw_diameter/2;       // polomer soubu
r9=M3_screw_head_diameter/2;  // polomer hlavy soubu

// Oblast vicka
v=M3_screw_head_diameter+4;  //vyska pro ulozeni vicka
h11=v;

// Bateriove pouzdro
b=10+v;                       // vyska prostoru mezi baterii a vyckem
p6=b+15;                       // vyska rozsireni pro ulozeni baterie
h10=p6-4;

// Dioda
led=20;                        // vyska led diody
draty=10;                      // vyska prostoru na draty
stena=1.2;                      //tloustka spodni steny ulozeni diody
p5=p6+stena+led+draty;         // vyska rozsileni pro ulozeni diody


// Vyska tela
h2=r2+r1+p5;              // vyska kolimatoru bez okularoveho vytahu
h1=h2+25;                   // vyska kolimatoru

// Predefinovane vysky
z1=h2-r2-Posun_pruzoru;     // vyska stredu otvoru pro odecitani ze stupnice

// Vyska (kolimacni srouby)
h7=r5+3.5;                    // poloha dna pro matku
h8=20;                      // delka pruzoru pro sroub
h9=1.8;                       // vyska ulozeni pro hlavu sroubu

// Kostka
a1=(4*(z1))/(sqrt(2));      // delka hrany kostky (pruzor kolimatoru)
a2=40;
a3=40;

//Srouby pro kolimaci   
srouby=3;
dno=5;
h12=v+dno+10;
h13=20;

//KOLIMATOR (telo)
difference() {
    union() {                               // zakladni obalka
        cylinder(r=r1,h=h1);
        cylinder(r=r2,h=h2);
    }
    union() {
        difference() {                      // pruzory
            union() {
                cylinder(r=r3,h=h1+0.1);
                translate([0,0,z1])
                    rotate ([0,-90,0])
                        cylinder(r=r3,h=h1);
            }
            translate([z1,0,0])
                rotate ([0,45,0])
                    cube([a1,a1,a1],center=true);           
            }
        cylinder(r=r4,h=h1);                    // uzky pruzor laseru
        translate([0,0,p5-0.1])
            cylinder(r1=r5,r2=0,h=r5*1.5);
        
        #cylinder(r=r5,h=p5);                // dutina na ulozeni pouzdra diody
        
        cylinder(r=r10,h=p6);                // ulozeni baterie
            
        #cylinder(r=r10,h=h10);             // rozsireni za baterii
        translate([0,0,-0.1])
            cylinder(r=r11,h=h11);          // ulozeni vicka
            
        
        
        //Horni ulozeni sroubu    
        for(rot=[1:srouby])                 
            translate([0,0,p5-r7-3])
                rotate ([rot*360/srouby+60,-90,0]){
                    cylinder(r=r7,h=h7,$fn=6);      //matka 
                    cylinder(r=r8,h=h8);            //telo sroubu
                    translate([0,0,r2-h9-0.1])
                        #cylinder(r=r9,h=h9+0.1);       //hlavy sroubu 
                }
        
        //Dolni ulozeni sroubu
        for(rot=[1:srouby])                 
            translate([0,0,p6+r7+5])
                rotate ([rot*360/srouby,-90,0]){
                    cylinder(r=r7,h=h7,$fn=6);      //matka
                    cylinder(r=r8,h=h8);            //telo sroubu
                    translate([0,0,r2-h9-0.1])
                        #cylinder(r=r9,h=h9+0.1);       //hlavy sroubu
                } 
        
        //Srouby pro uchyceni vicka
        for(rot=[1:srouby])                 //dolni ulozeni sroubu
            translate([0,0,v/2])
                rotate ([rot*360/srouby,-90,0]){
                    cylinder(r=r8,h=h8);            //telo sroubu
                    translate([0,0,r2-h9+0.8+0.1])
                        #cylinder(r=r9,h=h9);       //hlavy sroubu
        
                } 
        }

translate([0,0,p6])
            cylinder(r=r6,h=0.2);                // ulozeni baterie    
}
echo(r2-h9-h7);
echo(r2-h9-r5-1);
echo(r2);
echo(p6);