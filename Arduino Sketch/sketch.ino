byte index = 0;
int value = 0;
int pin = 11;

char inChar;

void setup(){

  Serial.begin(9600);  
}

void loop(){
 
   value = serReadInt();
   if (value >= 0){
      
      analogWrite(pin, value);
   }
   
}


int serReadInt()
{
 int i, serAva;                           
 char inputBytes [7];                 
 char * inputBytesPtr = &inputBytes[0];   
     
 if (Serial.available()>0)            
 {
   delay(5);                              
   serAva = Serial.available();  
   for (i=0; i<serAva; i++)       
     inputBytes[i] = Serial.read();
   inputBytes[i] =  '\0';             
   return atoi(inputBytesPtr);    
 }
 else
   return -1;                           
}
