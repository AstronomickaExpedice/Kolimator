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
r5=7;                   // polomer dutiny na ulozeni pouzdra diody
r6=10.5+1.5;            // polomer ulozeni baterie
r10=r2-2-2;           //polomer volne plochy (baterie/vicko)
r11=r2-2;             //polomer ulozeni vicka
rud=r5-3;                //polomer ulozeni diody

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
rd=3;                            //polomer diody


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
dno=6;
h12=v+dno+10;
h13=20;


module ulozeni_laseru(){
    //Ulozeni diody

    difference() {
        cylinder(r=rud,h=stena+led+draty-2);               
        cylinder(r=rd+0.25,h=20);
        translate([0,0,stena+11])
            cylinder(r=rd+0.5,h=20);
        
    }
    difference() {
        cylinder(r=rud,h=stena);
        cylinder(r=1.5,h=20);
        }
    }       
echo("r5",r5);
    
