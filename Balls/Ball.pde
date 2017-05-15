class Ball{
  //x position
   float x;
   //y position
   float y;
   //radius
   float rad;
   //color
   color c;
   //speed in the x
   float dx;
   //speed in the y
   float dy;
   //state
   //0: default
   //1-10: recently hit (cannot collide until back to 0)
   //41: growing
   //45: dying
   //50: dead
   int state;
   
   Ball(){
     float r = random(256);
     float g = random(256);
     float b = random(256);
     //diagnostic
     //System.out.println("" + r + " " + g + " " + b + " " + c);
     c = color(r, g, b);
     //rad = 10;
     rad = random(10) + 5;
     x = random((width - r) + r/2);
     y = random((height-r) +r/2);
     dx = random(10)-5;
     dy = random(10)-5;
     state = 0; //regular moving state
   }
   
   void move(){
     //changing position of the ball
     x = x + dx;
     y = y + dy;
     bounce();
   }
   
   void bounce(){
     //if at the ball: will bounce
     if((x < rad) || x > (800 - rad)){
        dx *= -1; 
     }
     if((y < rad) || y > (800 - rad)){
        dy *= -1; 
     }
   }
   
   boolean collision(Ball b){
     if((dist(this.x, this.y, b.x, b.y) < (this.rad + b.rad)) && (dist(this.x, this.y, b.x, b.y) > 0) && b.rad > 0){
         state = 10; //10: recently collided; will count down
         //collision: dist must be within the sum of the radii, and 
         //not perfectly equal to avoid "self-collisions"
         if(b.state > 10 && b.rad > 0){ ///
           //causes chain reaction of growing balls
           state = 41; //growing state
         }
         return true;
     }
     else{
        return false; 
     }
   }

   
   
   void click(){
     if(mousePressed){
       //if mouse is clicked
       //if balls are within 100 pixels of the mouse, they will start growing and dying
        if(dist(x, y, pmouseX, pmouseY) < 100 && state <= 10){
          //state <10: moving, not growing or shrinking
          //circumvents the problem of balls rising from the dead
           state = 41; //growing 
        }
     }
   }
}