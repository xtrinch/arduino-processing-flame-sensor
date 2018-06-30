import processing.serial.*;

Serial myPort;
float flameSensorAnalog=0;
boolean flameSensorDigital= false;

void setup() {
size(400, 150);
println(Serial.list());
myPort = new Serial(this, Serial.list()[0], 9600);
myPort.bufferUntil('\n');
}
 
void draw() {
background(0,0,0);
fill(255);
textSize(32);
text("Analog value: "+nf(flameSensorAnalog, 0, 1), (30), 2*height/3);    
  if (flameSensorDigital)
  {
     text("Flame present", 30, height/3);
  }
  else 
  {
     text("No flame", 30,height/3);
  }
    

}
 
void serialEvent(Serial myPort) { 
  String inString;
  String[] strings;
  
   inString = new String(myPort.readBytesUntil('\n'));
    if (inString != null) 
    {
       strings = inString.split("-");
       if (strings[0].equals("1"))
       {
         flameSensorAnalog = float(strings[1]);
       }
       else if  (strings[0].equals("2") && strings[1] != null)
       {
         flameSensorDigital = int(strings[1].charAt(0)) > 0;
         System.out.println(int(strings[1].charAt(0)));
         System.out.println(strings[1]);
       }
    }
}
