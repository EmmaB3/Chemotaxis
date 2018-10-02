 //declare bacteria variables here  
 int[] colors = {#ff0000,#ff9d00, #ffee00,#21f20e ,#0ee2f1 ,#dc19ff ,#ff5e96}; 
 int currentColor = 0;
 Bacteria [] dots = new Bacteria[25];
 void setup()   
 {     
 	size(500,500); 
 	noStroke();
 	for(int a = 0; a < dots.length; a++){
 		dots[a] = new Bacteria();
 	}
 }   
 void draw()   
 {    
 	background(0);
 	for(int a = 0; a < dots.length; a++){
 		dots[a].show();
 		dots[a].move();
 	}
 	for(int a = 0; a < colors.length; a++){
 		fill(colors[a]);
 		rect(15 * (a + 1), 480, 10, 10);
 	}
 }  

void mousePressed(){
	for(int a = 0; a < dots.length; a ++){
		dots[a].burst();
	}
	if(mouseY > 480 && mouseY < 490 && mouseX > 15 && mouseX < 15 * (colors.length + 1)){
		System.out.println((int)(mouseX / 15) + 1);
	}

 }
 class Bacteria    
 {    
 	int x,y,c;
 	Bacteria(){
 		x = 250;
 		y = 250;
 	}
 	void move(){
 		x += (int)(Math.random()*3) - 1;
 		y += (int)(Math.random()*3) - 1;
 	}
 	void show(){
 		c = colors[currentColor];
 		fill(c);
 		ellipse(x,y,3,3);
 	}

 	void burst(){
 		System.out.println("burst");
 	}
 }    