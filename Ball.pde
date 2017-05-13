class Ball{
   float x;
   float y;
   float rad;
   color c;
   float dx;
   float dy;
   int state;
   
   Ball(){
     float r = random(256);
     float g = random(256);
     float b = random(256);
     System.out.println("" + r + " " + g + " " + b + " " + c);
     c = color(r, g, b);
     rad = 10;
     x = random((width - r) + r/2);
     y = random((height-r) +r/2);
     dx = random(10)-5;
     dy = random(10)-5;
     state = 0; //regular moving state
   }
   
   void move(){
     x = x + dx;
     y = y + dy;
     bounce();
   }
   
   void bounce(){
     if(x < 0 || x > 800){
        dx *= -1; 
     }
     if(y < 0 || y > 800){
        dy *= -1; 
     }
   }
   
   boolean collision(Ball b){
     if((dist(this.x, this.y, b.x, b.y) < rad * 2) && (dist(this.x, this.y, b.x, b.y) > 0)){
         state = 10; //10: recently collided; will count down
         return true;
     }
     else{
        return false; 
     }
   }
   
   void click(){
     if(mousePressed){
        if(dist(x, y, mouseX, mouseY) < 100 && state <= 10){
           state = 41; //growing 
        }
     }
   }
}