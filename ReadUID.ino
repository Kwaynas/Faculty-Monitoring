#include <SPI.h>
#include <MFRC522.h>
#include "LCDIC2.h"
LCDIC2 lcd(0x27, 16, 2);

#define SS_PIN 10
#define RST_PIN 9
#define BZR_PIN 8
//SDA 10
//MOSI 11
//MISO 12
//SCK 13

MFRC522 rfid(SS_PIN, RST_PIN); // Instance of the class

MFRC522::MIFARE_Key key; 
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  SPI.begin(); // Init SPI bus
  rfid.PCD_Init(); // Init MFRC52
  lcd.begin();
  lcd.print("Please wait...");
  delay(2000);
  lcd.setBacklight(false);
  lcd.clear(); 
  
}

void loop() {
  
  // Reset the loop if no new card present on the sensor/reader. This saves the entire process when idle.
  if ( ! rfid.PICC_IsNewCardPresent())
    return;

  // Verify if the NUID has been readed
  if ( ! rfid.PICC_ReadCardSerial())
    return;
  // print UID to MATLAB.
    printHex(rfid.uid.uidByte, rfid.uid.size);
  //wait for matlab  response
    display();
  // Delay to prevent double tap
    delay(500);
  // Insert other functions here
}


//UID reading function
void printHex(byte *buffer, byte bufferSize) {
  for (byte i = 0; i < bufferSize; i++) {
    Serial.print(buffer[i] < 0x10 ? "0" : "");
    Serial.print(buffer[i], HEX);
  }
    // Halt PICC
  rfid.PICC_HaltA();

}

void display(){
  int count = 0;
  while ((Serial.available() == 0) && (count < 50)){
    count++;
    delay(10);
  }
  if (Serial.available() > 0){
    lcd.setBacklight(true);
    lcd.print("Tap Recorded! :)");
    tone(BZR_PIN, 1500, 250);
    delay(2000);
    lcd.clear();
    lcd.setBacklight(false);
    Serial.end();
    Serial.begin(9600);
    
  }
  else{
    Serial.print("\tNo input detected\t");
  }
  
}
