import 'package:shared_preferences/shared_preferences.dart';

String? upButton;
String? downButton;
String? leftButton;
String? rightButton;

String? button1;
String? button2;
String? button3;
String? button4;
String? button5;
String? button6;
String? button7;
String? button8;
String? button9;
String? button0;

bool? alreadyVisited;

void getVisitingStatus() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  alreadyVisited =  prefs.getBool('alreadyVisited') ?? false;
}

void setVisitingStatus() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('alreadyVisited', true);
  prefs.commit();
}

void loadSettings() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();

  upButton = prefs.getString('upButton');
  downButton = prefs.getString('downButton');
  leftButton = prefs.getString('leftButton');
  rightButton = prefs.getString('rightButton');

  button1 = prefs.getString('button1');
  button2 = prefs.getString('button2');
  button3 = prefs.getString('button3');
  button4 = prefs.getString('button4');
  button5 = prefs.getString('button5');
  button6 = prefs.getString('button6');
  button7 = prefs.getString('button7');
  button8 = prefs.getString('button8');
  button9 = prefs.getString('button9');
  button0 = prefs.getString('button0');
}

void restoreToDefaults() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.clear();

  await prefs.setString('upButton', "F");
  await prefs.setString('downButton', "B");
  await prefs.setString('leftButton', "L");
  await prefs.setString('rightButton', "R");

  await prefs.setString('button1', "1");
  await prefs.setString('button2', "2");
  await prefs.setString('button3', "3");
  await prefs.setString('button4', "4");
  await prefs.setString('button5', "5");
  await prefs.setString('button6', "6");
  await prefs.setString('button7', "7");
  await prefs.setString('button8', "8");
  await prefs.setString('button9', "9");
  await prefs.setString('button0', "0");

  prefs.commit();
}

Future<void> changeButtonMapping(
    String upButton,
    String downButton,
    String leftButton,
    String rightButton,
    String button1,
    String button2,
    String button3,
    String button4,
    String button5,
    String button6,
    String button7,
    String button8,
    String button9,
    String button0
    ) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.clear();

  await prefs.setString('upButton', upButton);
  await prefs.setString('downButton', downButton);
  await prefs.setString('leftButton', leftButton);
  await prefs.setString('rightButton', rightButton);

  await prefs.setString('button1', button1);
  await prefs.setString('button2', button2);
  await prefs.setString('button3', button3);
  await prefs.setString('button4', button4);
  await prefs.setString('button5', button5);
  await prefs.setString('button6', button6);
  await prefs.setString('button7', button7);
  await prefs.setString('button8', button8);
  await prefs.setString('button9', button9);
  await prefs.setString('button0', button0);

  prefs.commit();
}