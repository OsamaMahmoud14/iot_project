#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <FirebaseESP8266.h>
#include "DHT.h"

#define DHT_PIN D5
DHT dht(DHT_PIN, DHT11);

#define gas A0
#define fire D6
#define buzzer D2
#define ir D7


const char* WIFI_SSID = "osama14";
const char* WIFI_PASS = "123456789";

const char* FIREBASE_HOST = "smarthome-8f996-default-rtdb.firebaseio.com/";
const char* FIREBASE_AUTH = "SHIfBJbgEWOdi9qpVMzhIL1UUPpxs6zZoYMqviXZ";

const char* broker = "192.168.137.1";
const int port = 1883;
const char* topic1_G = "home/Gas";
const char* topic1_F = "home/Fire";
const char* topic1_T = "home/Temperature";
const char* topic1_M = "home/Motion";
bool Close=0;
unsigned long startTime = 0;
FirebaseData fbdo;
WiFiClient espClient;
PubSubClient client(espClient);

void on_message(char* topic, byte* message, unsigned int length) {
  Serial.print("Message received: ");                 // A message prefix

 for (int i = 0; i < length; i++)                    // Loop through the message bytes
    Serial.print((char)message[i]);                   // Print each character to the Serial Monitor
  if(message[0]=='0')
    {
      Close=0;
    }
   else 
      Close=1;
  Serial.println();                                   // Move to a new line after printing the message
}  


void setup() {
  Serial.begin(115200);
  WiFi.begin(WIFI_SSID, WIFI_PASS);

  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }

  Serial.println("Connected to WiFi.");
  Serial.print("IP Address: ");
  Serial.println(WiFi.localIP());

  client.setServer(broker, port);
  client.setCallback(on_message);
  if (client.connect("NodeMCU_Publisher")) {
    Serial.println("Connected to MQTT broker.");
    client.subscribe(topic1_M); // Subscribe to the "home/Motion" topic
  }
  dht.begin();
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Firebase.reconnectWiFi(true);
  startTime = millis(); // Record the start time
  pinMode(gas, INPUT);
  pinMode(fire, INPUT);
  pinMode(ir, INPUT);
  pinMode(buzzer, OUTPUT);
  
}

void loop() {
 
  delay(1000);
  int change=0;
while(true)
{
  if (!client.connected()) {
    while (!client.connect("NodeMCU_Publisher")) {
      Serial.println("Connecting to MQTT...");
      delay(1000);
    }
  }
  client.loop();
  float temp = dht.readTemperature();
  bool fire_read = digitalRead(fire);
  int motion = digitalRead(ir);       
  int Gas = analogRead(gas);
  int Time = ((millis() - startTime) / 1000/60);

  if ((!motion && !Close) || !fire_read)
  {
    digitalWrite(buzzer, HIGH);
    delay(1000);
  }
  else digitalWrite(buzzer, LOW);

  publish_m(temp, topic1_T);
  publish_m(fire_read, topic1_F);
  publish_m(Gas, topic1_G);

  if(Time != change)
  {
  if(Firebase.pushFloat(fbdo, "/Home/temp", temp)) {
    Serial.print("Temperature: ");
    Serial.print(temp);
    Serial.println("°C ");
    
  }else {
    Serial.println(fbdo.errorReason());
  }

  if(Firebase.pushInt(fbdo, "/Home/fire", fire_read)) {
    Serial.print("Fire: ");
    Serial.println(fire_read);
  }else {
    Serial.println(fbdo.errorReason());
  }

  if(Firebase.pushInt(fbdo, "/Home/Gas", Gas)) {
    Serial.print("Gas: ");
    Serial.println(Gas);
  }else {
    Serial.println(fbdo.errorReason());
  }
  if(Firebase.pushInt(fbdo, "/Home/Motion", motion)) {
    Serial.print("Motion: ");
    Serial.println(motion);
  }else {
    Serial.println(fbdo.errorReason());
  }
  if(Firebase.pushInt(fbdo, "/Home/Time", Time)) {
    Serial.print("time stamp: ");
    Serial.println(Time);
  }else {
    Serial.println(fbdo.errorReason());
  }
  change++;
  }
  delay(1000);
}
 
}

template<typename T>
void publish_m(T msg, const char* topic) {
  String message = String(msg);
  client.publish(topic, message.c_str());
  Serial.print("Published message: ");
  Serial.println(message);
}
