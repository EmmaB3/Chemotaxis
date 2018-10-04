 //declare bacteria variables here  
 int[] colors = {#ff0000,#ff9d00, #ffee00,#21f20e ,#0ee2f1 ,#dc19ff ,#ff5e96}; 
 int currentColor = 0;
 Bacteria [] dots = new Bacteria[50];
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

void mouseReleased(){
	for(int a = 0; a < dots.length; a ++){
		dots[a].bursting = true;
		dots[a].counter = 0;
		dots[a].angle = Math.random()*2*Math.PI;
	}
	if(mouseY > 480 && mouseY < 490 && mouseX > 15 && mouseX < 15 * (colors.length + 1)){
		currentColor = (int)(mouseX / 15) - 1;
	}

 }
 class Bacteria    
 {    
 	int x,y,c,counter;
 	boolean bursting = false;
 	double angle;
 	Bacteria(){
 		x = 250;
 		y = 250;
 	}
 	void move(){
 		if(bursting){
 			int xTarget = (int)((Math.cos(angle)*100) + x);
 			int yTarget = (int)((Math.sin(angle)*100) + y);
 			println(xTarget + " " + yTarget);
 			int xSign = Math.signum(xTarget - x)== 0 ? 2 : (int)(Math.signum(xTarget - x)) ;
		    int ySign = Math.signum(yTarget - y) == 0 ? 2 : (int)(Math.signum(yTarget - y));
		    if(counter < 30){
			    //x += (int)(Math.random()*5*Math.signum(xSign)) + (-1 * xSign);
			    //y += (int)(Math.random()*5*Math.signum(ySign)) + (-1 * ySign);
			    x += Math.signum(xTarget - x)*5;
			    y += Math.signum(yTarget - y)*5;
			    counter ++;
			}else{
				bursting = false;
			}

 		}else{
		    int xSign = Math.signum(mouseX - x)== 0 ? 2 : (int)(Math.signum(mouseX - x)) ;
		    int ySign = Math.signum(mouseY - y) == 0 ? 2 : (int)(Math.signum(mouseY - y));
		    x += (int)(Math.random()*5*Math.signum(xSign)) + (-1 * xSign);
		    y += (int)(Math.random()*5*Math.signum(ySign)) + (-1 * ySign);
		}	
 	}
 	void show(){
 		c = colors[currentColor];
 		fill(c);
 		ellipse(x,y,3,3);
 	}
 }    
