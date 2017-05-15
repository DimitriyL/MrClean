boolean reactionStarted;
Ball[] balls;

void setup(){
   //background(0, 0, 0);
   size(800, 800);
   reactionStarted = false;
   balls = new Ball[25];
   //the set of 25 balls
   for(int i = 0; i < 25; i++){
      balls[i] = new Ball(); 
   }
   /*for(Ball x: balls){
      fill(x.c);
      ellipse(x.x, x.y, x.rad * 2, x.rad * 2);
   }*/
  // color(100);
}

void draw(){
  //random; background updates to avoid balls leaving a trail
  background(47);
  for(Ball a: balls){
      a.move();
      for(Ball b: balls){
        //checks for a collision with all other balls
         if((a.state == 0) && a.collision(b) && b.rad > 0){
           //balls swap movement properties
            float bx = a.dx;
            float by = a.dy;
            a.dx = b.dx;
            a.dy = b.dy;
            b.dx = bx;
            b.dy = by;
         }
      }
      if(a.state > 0 && a.state <= 10){
        //10-cycle wait to get a ball out of collision range
         a.state -= 1; 
      }
      a.click();
      if(a.state == 41){
        //growing state
         a.dx = a.dy = 0;
         a.rad += 0.2;
      }
      if(a.rad > 20){
        //fully grown
         a.state = 45; //dying state
      }
      if(a.state == 45){
        //shrinking process
         if(a.rad > 0){
            a.rad -= 0.2; 
         }
      }
      if(a.rad == 0){
         a.state = 50; //dead 
      }
      
      if(a.rad > 0){
        //creates the shape; makes sure dead balls don't show up
        ellipse(a.x, a.y, a.rad * 2, a.rad * 2);
        fill(a.c);
      }
  }
}