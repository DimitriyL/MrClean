boolean reactionStarted;
ArrayList<Ball> balls;

void setup(){
   //background(0, 0, 0);
   size(800, 800);
   reactionStarted = false;
   balls = new ArrayList();
   for(int i = 0; i < 25; i++){
      balls.add(new Ball()); 
   }
   /*for(Ball x: balls){
      fill(x.c);
      ellipse(x.x, x.y, x.rad * 2, x.rad * 2);
   }*/
  // color(100);
}

void draw(){
  background(47);
  for(Ball a: balls){
      a.move();
      for(Ball b: balls){
         if((a.state == 0) && a.collision(b)){
            a.dx = random(10) - 5;
            a.dy = random(10) - 5;
         }
      }
      if(a.state > 0 && a.state <= 10){
         a.state -= 1; 
      }
      a.click();
      if(a.state == 41){
         a.dx = a.dy = 0;
         a.rad += 0.2;
      }
      if(a.rad > 20){
         a.state = 45; //dying
      }
      if(a.state == 45){
         if(a.rad > 0){
            a.rad -= 0.2; 
         }
      }
      if(a.rad == 0){
         a.state = 50; //dead 
         for(int q = 0; q < balls.size(); q++){
           if(balls.get(q).equals(a)){
             balls.remove(q);
           }
         }
      }
      
      if(a.rad > 0){
      ellipse(a.x, a.y, a.rad * 2, a.rad * 2);
      fill(a.c);
      }
  }
}