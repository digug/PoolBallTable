//By Douglas Yau and Mohamed Yassin

import ddf.minim.*; //implementing the audio
Minim minim;
AudioPlayer au_player1, au_player2;
 int time=0;//global time for timer
  
  


PVector velocity;
void setup()
{
  size(1000, 400);//size of window
  Vector(); //calls vector function
  minim = new Minim(this) ;
 au_player1 = minim.loadFile("Ball Bounce.mp3", 512) ;//initializes au_player1 to specific mp3 file
 au_player2 = minim.loadFile("cueball.mp3", 512) ; //initializes au_player2 to specific mp3 file
}

void stop()
{
 minim.stop() ;
 super.stop() ;
}

void mousePressed()
{
 au_player2.rewind();
 au_player2.play() ;
}


void Vector() 
{
  velocity= new PVector(0, 0); //copies Pvector into velocity
}


void keyReleased()
{
  
  
 switch (key) //when key is pressed
 {
   case 'r': //if "r" is pressed 
   
   for (int i = 0 ; i < b_arr.length; i++) //loop and go through all of the balls to make sure that they are all ressetted to true
  {
      b_arr[i].Switch = true;
  }
  
  

  //resets the value of the array to original
    b_arr [0].vx= 0;
    b_arr [0].vy= 0;
    b_arr [1].vx= 0;
    b_arr [1].vy= 0;
    b_arr [2].vx= 0;
    b_arr [2].vy= 0;
    b_arr [3].vx= 0;
    b_arr [3].vy= 0;
    b_arr [4].vx= 0;
    b_arr [4].vy= 0;
    b_arr [5].vx= 0;
    b_arr [5].vy= 0;
    b_arr [6].vx= 0;
    b_arr [6].vy= 0;
    
    b_arr [0].center.x= 200;
    b_arr [0].center.y= 200;
    b_arr [1].center.x= 500;
    b_arr [1].center.y= 200;
    b_arr [2].center.x= 525;
    b_arr [2].center.y= int(212.5);
    b_arr [3].center.x= 525;
    b_arr [3].center.y= int(187.5);
    b_arr [4].center.x= 550;
    b_arr [4].center.y= 225;
    b_arr [5].center.x= 550;
    b_arr [5].center.y= 200;
    b_arr [6].center.x= 550;
    b_arr [6].center.y= 175;

}

switch (key) //when key is pressed

 {
   case ' ':  //if spacebar is pressed 
setup();  //call setup to display stick

}

}



void mouseClicked() 
{
  velocity.x= (b_arr [0].center.x-mouseX)*0.1;  //sets velocity(speed) in x direction based on distance from center of cueball
  velocity.y= (b_arr [0].center.y-mouseY)*0.1;  //sets velocity(speed) in y direction based on distance from center of cueball
  b_arr[0].vx=velocity.x; //now sets the speed of the cue ball (b_arr[0]) in x direction as the value of velocity in the x direction
  b_arr[0].vy=velocity.y; //now sets the speed of the cue ball (b_arr[0]) in y direction as the value of velocity in the y direction
}

class Point
{
  float x, y;
  Point (float a, float b)//receives two float arguments which corresponds to the x and y values 
  {
    x = a;
    y = b;
  }
}

class Ball
{
  float v;//overall velocity
  float vx;//velocity in x direction
  float vy; //velocity in y direction 
  float rad;//radius of the ball
  Point center;//center point of the ball
  Point contact_point;//contact point of the ball
  color col;//color of ball
  boolean Switch = true;//switch of the ball - tells the program whether to draw the ball or not

  Ball(int c, float x, float y)//ball declarator: receives (color, x coordinate of ball, y coordinate of ball)
  {
    rad=12.5;//radius of the ball
    center= new Point (x, y);//coordinates of the ball
    contact_point= new Point(x+12.5, y+12.5);//contact point of the ball
    col=c;//color of the ball
  }





  boolean holecheck(Ball b)//checks if the ball is inside the hole or not. X and Y coord. should be outside of the dimensions of the hole.
  {
    {
    if ((b.center.x < 40 && b.center.y < 40)||(b.center.x < 30 && b.center.y > 350)||(b.center.x > 790&& b.center.y < 40)||(b.center.x > 800 && b.center.y > 400))
    {
      b.vx=0;//if the ball is in the hole, set the velocities as 0
      b.vy=0;
      return true;//return a boolean to draw so the program will determine whether to draw the ball or not
    }
    return false;//otherwise, return false so the program won't eliminate the ball
    }  
    }



  void draw_ball(Ball x, int i)//receives a class Ball variable and the number where the loop is at
  {
    noStroke();
    if (x.Switch == true)// if the switch is true, that means that the ball is not in the hole yet. The program draws the ball
    {
      fill(x.col);//fill the ball with the color variable in the ball
      ellipse(x.center.x, x.center.y, (x.rad)*2, (x.rad)*2);//draw the ball
    }
    else//switch is false, therefore the balls will be placed out of the table and a score board will be shown on the side, keeping track of the balls 
    {
      fill(x.col);
      ellipse(850,30 + x.rad*2* i,12.5,12.5);//where the balls will be drawn outside
    }
  }

  void hit(Ball x)//detects collsion with wall and moves the ball
  {    
  
    x.center.x+=vx;    //move the ball in the x direction with the x component of the vector      
    x.center.y+=vy;    //move the ball in the y direction with the y component of the vector

    if (x.center.y-x.rad < 10 && x.center.x+x.rad >40 && x.center.x+x.rad < 772.5)//if the ball hits the wall
    {
      x.center.y=22.5;//position the ball where it is at the edge so it won't go over the table
      vy*= -1;//negative its y vector
      au_player1.rewind();//Rewind sound effeect and then play sound effect
      au_player1.play();//it is similar with other wall collisions
    }
    if (x.center.y+x.rad > 390 && x.center.x+x.rad >40 && x.center.x+x.rad < 772.5)
    {
      x.center.y=377.5;
      vy*= -1;
      au_player1.rewind();
      au_player1.play();
    }
    if (x.center.x-x.rad < 10 && x.center.y+x.rad > 40 && x.center.y+x.rad < 372.5)
    {
      x.center.x=22.5;
      vx*= -1;
      au_player1.rewind();
      au_player1.play();
    }
    if (x.center.x+x.rad > 790 && x.center.y+x.rad > 40 && x.center.y+x.rad < 372.5)
    {
      x.center.x=777.5;
      vx*= -1;
      au_player1.rewind();
      au_player1.play();
    }
  }  



  void friction(Ball x)
  {       
    x.vx*=0.97;//add friction to the ball the where it deaccelerates on both x and y vectors. 
    x.vy*=0.97;
  }
  
}

class Stick
{
  Point start_p;
  Point end_p;
  color col; //color of the pool stick
  int length; //length of the pool stick
  int power;
  Stick()
  {
    int length = 10;
    start_p = new Point (mouseX, mouseY);
    end_p = new Point(mouseX+length, mouseY+length);
  }
}

class Table
{
 Ball [] b_arr; 
 Ball cue_ball; 
 Stick st;
 
}

 
  Ball [] b_arr = new Ball [7]; //the original array of balls with colors and different locations
  {
  b_arr [0] = new Ball (255, 200, 200);
  b_arr [1] = new Ball (0, 500, 200);
  b_arr [2] = new Ball (#F50C0C, 525, 212.5);
  b_arr [3] = new Ball (#1A1FEA, 525, 187.5);
  b_arr [4] = new Ball (#2AD81F, 550, 225);
  b_arr [5] = new Ball (#F6FF00, 550, 200);
  b_arr [6] = new Ball (#8B1634, 550, 175);
  }



void draw_stick()
{
  //the function creates a stick with a certain length. It's angle will follow the mouse and it changes color depending on the power/velocity.
  float hyp= sqrt(((b_arr [0].center.x-mouseX)*(b_arr [0].center.x-mouseX))+(((b_arr [0].center.y-mouseY)*(b_arr [0].center.y-mouseY))));
  if (hyp<30)
    stroke(#E7FC08);//changes color depending of the distance between mouse and ball, where the distance corresponds to the power
 else if (hyp>30&&hyp<110)
    stroke(#FC9F08);
 else if (hyp>110)
   stroke(#FC3908); 

  strokeWeight(5); 
  float N_angle = 0;//the normal angle between stick and ball
  float A_Angle = 0;//actual angle between stick and ball due to y axis increasing in an opposite dirction compared to normal graphs 
  float easing = 1; 
  N_angle = atan2( mouseY - b_arr [0].center.y, mouseX - b_arr [0].center.x);
  float direction = (N_angle - A_Angle) / TWO_PI;
  direction -= round( direction );
  direction *= TWO_PI;

  A_Angle += direction * easing;

  pushMatrix();
  translate( b_arr [0].center.x, b_arr [0].center.y );//the stick will always start at the middle point of the cueball
  rotate( A_Angle );//rotates the angle of the stick
  line( 0, 0, 200, 0 );//length of the line
  popMatrix();
}


void collision(Ball x, Ball y)
{
  float disx= y.center.x-x.center.x;
  float disy= y.center.y-x.center.y;
  
  if (sqrt((disy*disy + disx*disx)) < 25)
  {
    float Distance = sqrt(disx * disx + disy * disy);
    float LineX = disx / Distance;
    float LineY = disy / Distance;
    float middlepointx = (x.center.x + y.center.x) / 2;
    float middlepointy = (x.center.y + y.center.y) / 2;
    
  
                
                x.center.x = middlepointx - LineX * 12.5;
                x.center.y = middlepointy - LineY * 12.5;
                y.center.x = middlepointx + LineX * 12.5;
                y.center.y = middlepointy + LineY * 12.5;
                float vector_Z = (x.vx - y.vx) * LineX;
                vector_Z += (x.vy - y.vy) * LineY;
                float Zvx = vector_Z * LineX;
                float Zvy = vector_Z * LineY;
                x.vx -= Zvx;
                x.vy -= Zvy;
                y.vx += Zvx;
                y.vy += Zvy;


    
    
  }
}


void timer(int y)//receives a time from global
{
  frameRate(60);//set the frame rate as 60
  y = frameCount/60;//divide the number of frames by 60 so we get a second
  text ("Time: " + y + " seconds", 850, 15);//displays the time in seconds on the screen
}






void draw()
{
  
  //background color
  noStroke();
  background(127, 0, 0);
  fill(0, 80, 0);
  //the base of the table
  rect(10, 10, 780, 380);  
  fill(0);
  //white lines on the table for decoration
  line(200, 13, 200, 387);
  fill(0, 80, 0);
  arc(200, 200, 100, 100, PI/2, 3*PI/2);

  //the holes
  fill(0);
  ellipse(0, 0, 75, 75);
  ellipse(0, 400, 75, 75);
  ellipse(800, 0, 75, 75);
  ellipse(800, 400, 75, 75);
  
  //side board
  fill(255);
  rect (800,0,200,400);

    fill(0);
    textSize(15);
    text("    CLICK SPACEBAR", 820, 350);
    text(" TO DISPLAY CUESTICK ", 820, 370);
  
  timer(time);//call timer

  if (velocity.x== 0 && velocity.y ==0)// when the velocity 0, draw stick
  {
    draw_stick();
  }
  

  
    
    
  for (int i = 0; i < b_arr.length; i++) 
  {
        b_arr [i].hit(b_arr [i]);//single loop that checks wall collision, movement, friction, and drawings of all balls
        b_arr [i].friction(b_arr[i]);
        b_arr[i].draw_ball(b_arr[i],i);
        for (int j = i + 1; j < b_arr.length; j++) 
        {
          collision(b_arr[i], b_arr [j]); //double loop which detects collision with every ball
        }
  }

  for (int i = 0 ; i < b_arr.length; i++)
  {
    if (b_arr[i].holecheck(b_arr[i]) == true)//do a hole check for every ball
      b_arr[i].Switch = false;//if they are in the hole, Switch will be changed from true to false, the ball will no longer be drawn on the table but on the side
  }
  

  if (b_arr [0].holecheck(b_arr [0]) == true)
  {
    fill(0);
    textSize(30);//do a hole check on the white ball, if it is in the hole, end the game and prompt the user to restart
    text("You lose, Please Press R To Restart Game .", 300, 200);
    b_arr [0].Switch = false;
  }  
 
   
  if(b_arr[1].Switch == false && b_arr[2].Switch == false && b_arr[3].Switch == false && b_arr[4].Switch == false && b_arr[5].Switch == false && b_arr[6].Switch == false)
  {
    fill(0);//if all balls (except white ball) are in, print the you win message and prompt the user to restart
    textSize(30);
    text("You win! Please Press R To Restart Game .", 300, 200);
    b_arr [0].Switch = false;
  }
}