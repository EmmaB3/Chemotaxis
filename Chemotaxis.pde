 //declare bacteria variables here   
 void setup()   
 {     
 	size(500,500);   
 }   
 void draw()   
 {    
 	//move and show the bacteria   
 }  
 class Bacteria    
 {    
 	int myX, myY; 
 	Bacteria(){
 		myX = myY = 0;
 	}
 	void move(){
 		mX += (int)(Math.random()*3) - 1;
 		myY += (int)(Math.random()*3) - 1;
 	}
 	void show(){
 		fill(#729ce0);//testing
 		ellipse(myX,mY);
 	}
 }    