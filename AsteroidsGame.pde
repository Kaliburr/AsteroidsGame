Stars[] andromeda=new Stars[200];
SpaceShip starchild=new SpaceShip();
ArrayList<Asteroids>celes=new ArrayList<Asteroids>();
//ArrayList<Bullet>gun=new ArrayList<Bullet>();
public void setup() 
{
  size(500,500);
  for(int i=0;i<andromeda.length;i++){
    andromeda[i]=new Stars();
  }
  for(int i=0;i<24;i++){
    celes.add(new Asteroids());
  }
}
public void draw() 
{
  background(0);
  starchild.move();
  for(int i=0;i<andromeda.length;i++){
    andromeda[i].show();
  }
  for(int i=0;i<celes.size();i++){
    celes.get(i).show();
    celes.get(i).move();
    float d=dist(starchild.getX(),starchild.getY(),celes.get(i).getX(),celes.get(i).getY());
    if(d<25)
      celes.remove(i);
  }
  starchild.show();
  /*for(int i=0;i<gun.size();i++){
    gun.get(i).show();
    gun.get(i).move();
  }*/
  checkcollision();
}
public void keyTyped(){
      if(key=='a'){
        starchild.setDirectionX(-2);
        starchild.setPointDirection(180);
      }
      if(key=='d'){
        starchild.setDirectionX(2);
        starchild.setPointDirection(0);
      }
      if(key=='w'){
        starchild.setDirectionY(-2);
        starchild.setPointDirection(270);
      }
      if(key=='s'){
        starchild.setDirectionY(2);
        starchild.setPointDirection(90);
      }
      if(key=='f'){
        starchild.setDirectionX(-10);
        starchild.setPointDirection(180);
      }
      if(key=='h'){
        starchild.setDirectionX(10);
        starchild.setPointDirection(0);
      }
      if(key=='t'){
        starchild.setDirectionY(-10);
        starchild.setPointDirection(270);
      }
      if(key=='g'){
        starchild.setDirectionY(10);
        starchild.setPointDirection(90);
      }
      if(key=='e'){
        starchild.rotate(10);
      }
      if(key=='r'){
        starchild.rotate(-10);
      }
      if(key=='c'){
        //gun.add(new Bullet(starchild));
      }
      if(key==' '){
        starchild.setX((int)(Math.random()*501));
        starchild.setY((int)(Math.random()*501));
        starchild.setDirectionX(0);
        starchild.setDirectionY(0);
        starchild.setPointDirection((int)(Math.random()*360));
        starchild.setPointDirection((int)(Math.random()*360));
      }
}
public void checkcollision(){
  /*for(int i=0;i<gun.size();i++){
   for(int j=0;j<celes.size();j++){
    if(dist(celes.get(j).getX(),celes.get(j).getY(),gun.get(i).getX(),gun.get(i).getY())<20)
     {gun.remove(i);
     celes.remove(j);
     break;}
   }
  }*/
}
class Stars{
    int a,b,c,d,e;
    public Stars(){
      a=(int)(Math.random()*256);
      b=(int)(Math.random()*256);
      c=(int)(Math.random()*256);
      d=(int)(Math.random()*501);
      e=(int)(Math.random()*501);
    }
    public void show(){
      fill(a,b,c);
      ellipse(d,e,5,5);
    }
}
class SpaceShip extends Floater  
{   
    public SpaceShip(){
      corners=3;
      xCorners=new int[corners];
      yCorners=new int[corners];
      xCorners[0]=-8;
      yCorners[0]=-8;
      xCorners[1]=16;
      yCorners[1]=0;
      xCorners[2]=-8;
      yCorners[2]=8;
      myColor=color(32,73,123);
      myCenterX=250;
      myCenterY=250;
    }
    public void setX(int x){myCenterX=x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY=y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX=x;}   
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY=y;}   
    public double getDirectionY(){return myDirectionY;}   
    public void setPointDirection(int degrees){myPointDirection=degrees;}   
    public double getPointDirection(){return myPointDirection;}
}
/*class Bullet extends Floater{
  public Bullet(SpaceShip starchild){
    myCenterX=starchild.getX();
    myCenterY=starchild.getY();
    myPointDirection=starchild.getPointDirection();
    double dRadians =myPointDirection*(Math.PI/180);
    myDirectionX=5*Math.cos(dRadians)+starchild.getDirectionX();
    myDirectionY=5*Math.sin(dRadians)+starchild.getDirectionY();
  }
  public void setX(int x){myCenterX=x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX=x;}   
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY=y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection=degrees;}   
  public double getPointDirection(){return myPointDirection;}
  public void show(){
    fill(255,255,255);
    ellipse((float)myCenterX,(float)myCenterY,5,5);
  }
  public void move(){
    myCenterX+=myDirectionX;
    myCenterY+=myDirectionY;
  }
}*/
class Asteroids extends Floater{
  protected int asterotation;
  public Asteroids(){
    corners=4;
    xCorners=new int[corners];
    yCorners=new int[corners];
    xCorners[0]=-9;
    yCorners[0]=-9;
    xCorners[1]=9;
    yCorners[1]=-9;
    xCorners[2]=9;
    yCorners[2]=9;
    xCorners[3]=-9;
    yCorners[3]=9;
    myColor=color(223,182,132);
    myCenterX=(int)(Math.random()*501);
    myCenterY=(int)(Math.random()*501);
    myDirectionX=(int)(Math.random()*5)-2;
    myDirectionY=(int)(Math.random()*5)-2;
    asterotation=(int)(Math.random()*5)-2;
    myPointDirection=1;
  }
  public void setX(int x){myCenterX=x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}
  public int getY(){return (int)myCenterY;} 
  public void setDirectionX(double x){myDirectionX=x;}   
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY=y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection=degrees;}   
  public double getPointDirection(){return myPointDirection;}
  public void setastero(int astero){asterotation=astero;}
  public int getastero(){return (int)asterotation;}
  public void move(){
    super.move();
    rotate(asterotation);
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 
  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
