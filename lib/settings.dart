import 'package:bluetooth_controller/file_storage_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'controller.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  TextEditingController upButtonController = TextEditingController(text: upButton);
  TextEditingController downButtonController = TextEditingController(text: downButton);
  TextEditingController leftButtonController = TextEditingController(text: leftButton);
  TextEditingController rightButtonController = TextEditingController(text: rightButton);

  TextEditingController button1Controller = TextEditingController(text: button1);
  TextEditingController button2Controller = TextEditingController(text: button2);
  TextEditingController button3Controller = TextEditingController(text: button3);
  TextEditingController button4Controller = TextEditingController(text: button4);
  TextEditingController button5Controller = TextEditingController(text: button5);
  TextEditingController button6Controller = TextEditingController(text: button6);
  TextEditingController button7Controller = TextEditingController(text: button7);
  TextEditingController button8Controller = TextEditingController(text: button8);
  TextEditingController button9Controller = TextEditingController(text: button9);
  TextEditingController button0Controller = TextEditingController(text: button0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusScope.of(context).unfocus();},
      child: Scaffold(
        backgroundColor: const Color(0xff121212),
        appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body:ListView(
          padding: EdgeInsets.all(25),
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Icon(Icons.arrow_drop_up, color: Colors.white,),
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: upButtonController,
                    style: TextStyle(color: Colors.white),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"F\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Icon(Icons.arrow_drop_down, color: Colors.white,),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: downButtonController,
                    style: TextStyle(color: Colors.white),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"B\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Icon(Icons.arrow_right, color: Colors.white,),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: rightButtonController,
                    style: TextStyle(color: Colors.white),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"R\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Icon(Icons.arrow_left, color: Colors.white,),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: leftButtonController,
                    style: TextStyle(color: Colors.white),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"L\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Center(child: Text("1", style: TextStyle(color: Colors.white),)),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: button1Controller,
                    style: TextStyle(color: Colors.white,),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"1\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Center(child: Text("2", style: TextStyle(color: Colors.white),)),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: button2Controller,
                    style: TextStyle(color: Colors.white,),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"2\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Center(child: Text("3", style: TextStyle(color: Colors.white),)),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: button3Controller,
                    style: TextStyle(color: Colors.white,),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"3\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Center(child: Text("4", style: TextStyle(color: Colors.white),)),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: button4Controller,
                    style: TextStyle(color: Colors.white,),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"4\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Center(child: Text("5", style: TextStyle(color: Colors.white),)),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: button5Controller,
                    style: TextStyle(color: Colors.white,),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"5\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Center(child: Text("6", style: TextStyle(color: Colors.white),)),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: button6Controller,
                    style: TextStyle(color: Colors.white,),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"6\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Center(child: Text("7", style: TextStyle(color: Colors.white),)),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: button7Controller,
                    style: TextStyle(color: Colors.white,),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"7\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Center(child: Text("8", style: TextStyle(color: Colors.white),)),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: button8Controller,
                    style: TextStyle(color: Colors.white,),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"8\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Center(child: Text("9", style: TextStyle(color: Colors.white),)),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: button9Controller,
                    style: TextStyle(color: Colors.white,),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"9\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    child: Center(child: Text("0", style: TextStyle(color: Colors.white),)),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 200,
                  height:50,
                  child: TextField(
                    controller: button0Controller,
                    style: TextStyle(color: Colors.white,),
                    maxLength: 1,
                    decoration: InputDecoration(
                      hintText: "Default Signal: \"0\"",
                      hintStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  loadSettings();
                  showDialog(context: context, builder: (context){
                  return Dialog(
                    backgroundColor: const Color(0xff212121),
                    child: Container(
                      height: 250,
                      width: 100,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Forward Button: $upButton", style: TextStyle(color: Colors.white),),
                            Text("Backward Button: $downButton", style: TextStyle(color: Colors.white),),
                            Text("Left Button: $leftButton", style: TextStyle(color: Colors.white),),
                            Text("Right Button: $rightButton", style: TextStyle(color: Colors.white),),
                            Text("Button 1: $button1", style: TextStyle(color: Colors.white),),
                            Text("Button 2: $button2", style: TextStyle(color: Colors.white),),
                            Text("Button 3: $button3", style: TextStyle(color: Colors.white),),
                            Text("Button 4: $button4", style: TextStyle(color: Colors.white),),
                            Text("Button 5: $button5", style: TextStyle(color: Colors.white),),
                            Text("Button 6: $button6", style: TextStyle(color: Colors.white),),
                            Text("Button 7: $button7", style: TextStyle(color: Colors.white),),
                            Text("Button 8: $button8", style: TextStyle(color: Colors.white),),
                            Text("Button 9: $button9", style: TextStyle(color: Colors.white),),
                            Text("Button 0: $button0", style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  );
                });}, child: Text("Current Settings", style: TextStyle(color: Colors.white),), style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), padding: EdgeInsets.all(20), primary: Colors.deepPurpleAccent),),
                ElevatedButton(onPressed: () async{
                  restoreToDefaults();
                  loadSettings();
                  await Future.delayed(Duration(milliseconds: 500));
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Controller()));
                }, child: Text("Reset to Default", style: TextStyle(color: Colors.white),), style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), padding: EdgeInsets.all(20), primary: Colors.deepPurpleAccent),),
              ],
            ),

            SizedBox(height: 30,),

            ElevatedButton(onPressed: () async{
              FocusScope.of(context).unfocus();
              changeButtonMapping(
                  upButtonController.text,
                  downButtonController.text,
                  leftButtonController.text,
                  rightButtonController.text,
                  button1Controller.text,
                  button2Controller.text,
                  button3Controller.text,
                  button4Controller.text,
                  button5Controller.text,
                  button6Controller.text,
                  button7Controller.text,
                  button8Controller.text,
                  button9Controller.text,
                  button0Controller.text
              );
              loadSettings();
              await Future.delayed(Duration(milliseconds: 500));
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Controller()));
              }, child: Text("Save", style: TextStyle(color: Colors.white),), style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), padding: EdgeInsets.all(20), primary: Colors.deepPurpleAccent),)
          ],
        ),
      ),
    );
  }
}