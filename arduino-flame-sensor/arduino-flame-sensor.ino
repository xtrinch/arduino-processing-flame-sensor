void setup()
{
  pinMode(2, INPUT);
  Serial.begin(9600);             
}
 
void loop()
{
  int value1 = analogRead(0); 
  bool din = digitalRead(2);
  
  Serial.println("1-"+String(value1)); 
  Serial.println("2-"+String(din));
  delay(300);
}
