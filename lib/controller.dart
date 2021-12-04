import 'dart:ui';
import 'package:bluetooth_controller/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'file_storage_functions.dart';

class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {

  // Get the instance of the bluetooth
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  // Define some variables, which will be required later
  List<BluetoothDevice> _devicesList = [];
  BluetoothDevice? _device;
  bool _connected = false;

  @override
  void initState() {
    loadSettings();
    super.initState();
    bluetoothConnectionState();
  }

  // We are using async callback for using await
  Future<void> bluetoothConnectionState() async {
    List<BluetoothDevice> devices = [];

    // To get the list of paired devices
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }

    // Store the [devices] list in the [_devicesList] for accessing
    // the list outside this class
    setState(() {
      _devicesList = devices;
      //print(_devicesList);
    });
  }

  // Create the List of devices to be shown in Dropdown Menu
  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devicesList.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE', style: TextStyle(color: Colors.white),),
      ));
    } else {
      _devicesList.forEach((device) {
        items.add(DropdownMenuItem(
          child: Text("${device.name}", style: TextStyle(color: Colors.white),),
          value: device,
        ));
      });
    }
    return items;
  }

  // Method to connect to bluetooth
  void _connect() {
    if (_device == null) {
      print('No device selected');
    } else {
      bluetooth.isConnected.then((isConnected) {
        if (!isConnected) {
          bluetooth
              .connect(_device!)
              .timeout(Duration(seconds: 10))
              .catchError((error) {
            setState((){_connected = false;});
          });
          setState((){_connected = true;});
        }
      });
    }
  }

  // Method to disconnect bluetooth
  void _disconnect() {
    try{
      bluetooth.disconnect();
    } catch (e){
      print("No device to disconnect");
      final snackBar = SnackBar(
        content: Container(
          height: 15,
          width: 50,
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Text("No Device to Disconnect", style: TextStyle(color: Colors.red),),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        duration: Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    setState((){_connected = false;});
  }

  void _sendMessageToBluetooth(String? s) {
    bluetooth.isConnected.then((isConnected) {
      if (isConnected) {
        bluetooth.write("$s");
        print('Message Sent');
      }
    });
  }

  //Loop to create data streams
  bool _up = false;
  bool _down = false;
  bool _left = false;
  bool _right = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff121212),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                    left: 30,
                    child: Container(
                      width: 100,
                      height: 50,
                      child: Image(image: AssetImage('assets/TTA-Logo.png'),),
                    )
                ),
                Align(
                  child: SizedBox( //Bluetooth Status
                    width: 100,
                    height: 50,
                    child: DecoratedBox(decoration: BoxDecoration(
                      color:  _connected ? Colors.greenAccent : Colors.red,
                      border: Border.all(width: 5, color: Colors.black54),
                      borderRadius: BorderRadius.circular(50),
                    )),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onLongPressDown: (_)async {
                    _left = true;
                    do {
                      print('long pressing'); // for testing
                      _sendMessageToBluetooth("$leftButton");
                      await Future.delayed(Duration(milliseconds: 50));
                    } while (_left);
                  },
                  onLongPressEnd: (_){setState(() {_left = false; _sendMessageToBluetooth(null);});},
                  onLongPressCancel: (){setState(() {_left = false; _sendMessageToBluetooth(null);});},
                  child: ElevatedButton( //Left Arrow
                    onPressed: () {},
                    child: Icon(Icons.arrow_left, color: Colors.white, size: 30),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      side: BorderSide(width: 5, color: Colors.black54),
                      padding: EdgeInsets.all(20),
                      primary: Colors.deepPurpleAccent, // <-- Button color
                    ),
                  ),
                ),

                SizedBox(width: 10),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onLongPressDown: (_) async {
                        _up = true;
                        do {
                          print('long pressing'); // for testing
                          _sendMessageToBluetooth("$upButton");
                          await Future.delayed(Duration(milliseconds: 50));
                        } while (_up);
                      },
                      onLongPressEnd: (_){setState(() {_up = false; _sendMessageToBluetooth(null);});},
                      onLongPressCancel: (){setState(() {_up = false; _sendMessageToBluetooth(null);});},
                      child: ElevatedButton( //Up Arrow
                        onPressed: () {},
                        child: Icon(Icons.arrow_drop_up, color: Colors.white, size: 30),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          side: BorderSide(width: 5, color: Colors.black54),
                          padding: EdgeInsets.all(20),
                          primary: Colors.deepPurpleAccent, // <-- Button color
                        ),
                      ),
                    ),

                    SizedBox(height: 75),

                    GestureDetector(
                      onLongPressDown: (_) async {
                        _down = true;
                        do {
                          print('long pressing'); // for testing
                          _sendMessageToBluetooth("$downButton");
                          await Future.delayed(Duration(milliseconds: 50));
                        } while (_down);
                      },
                      onLongPressEnd: (_){setState(() {_down = false; _sendMessageToBluetooth(null);});},
                      onLongPressCancel: (){setState(() {_down = false; _sendMessageToBluetooth(null);});},
                      child: ElevatedButton( //Down Arrow
                        onPressed: () {},
                        child: Icon(Icons.arrow_drop_down, color: Colors.white, size: 30),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          side: BorderSide(width: 5, color: Colors.black54),
                          padding: EdgeInsets.all(20),
                          primary: Colors.deepPurpleAccent, // <-- Button color
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(width: 10),

                GestureDetector(
                  onLongPressDown: (_) async {
                    _right = true;
                    do {
                      print('long pressing'); // for testing
                      _sendMessageToBluetooth("$rightButton");
                      await Future.delayed(Duration(milliseconds: 50));
                    } while (_right);
                  },
                  onLongPressEnd: (_){setState(() {_right = false; _sendMessageToBluetooth(null);});},
                  onLongPressCancel: (){setState(() {_right = false; _sendMessageToBluetooth(null);});},
                  child: ElevatedButton( //Right Arrow
                    onPressed: () {},
                    child: Icon(Icons.arrow_right, color: Colors.white, size: 30),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      side: BorderSide(width: 5, color: Colors.black54),
                      padding: EdgeInsets.all(20),
                      primary: Colors.deepPurpleAccent, // <-- Button color
                    ),
                  ),
                ),

                SizedBox(width: 175,),

                Column( //Odd Panel
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () async{_sendMessageToBluetooth("$button1"); await Future.delayed(Duration(milliseconds: 50)); _sendMessageToBluetooth(null);},
                        child: Text("1"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                          side: BorderSide(width: 1, color: Colors.black54),)),
                    ElevatedButton(onPressed: () async{_sendMessageToBluetooth("$button3"); await Future.delayed(Duration(milliseconds: 50)); _sendMessageToBluetooth(null);},
                        child: Text("3"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                          side: BorderSide(width: 1, color: Colors.black54),)),
                    ElevatedButton(onPressed: () async{_sendMessageToBluetooth("$button5"); await Future.delayed(Duration(milliseconds: 50)); _sendMessageToBluetooth(null);},
                        child: Text("5"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                          side: BorderSide(width: 1, color: Colors.black54),)),
                    ElevatedButton(onPressed: () async{_sendMessageToBluetooth("$button7"); await Future.delayed(Duration(milliseconds: 50)); _sendMessageToBluetooth(null);},
                        child: Text("7"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                          side: BorderSide(width: 1, color: Colors.black54),)),
                    ElevatedButton(onPressed: () async{_sendMessageToBluetooth("$button9"); await Future.delayed(Duration(milliseconds: 50)); _sendMessageToBluetooth(null);},
                        child: Text("9"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                          side: BorderSide(width: 1, color: Colors.black54),)),
                  ],
                ),

                SizedBox(width: 50,),

                Column( //Even Panel
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () async{_sendMessageToBluetooth("$button2"); await Future.delayed(Duration(milliseconds: 50)); _sendMessageToBluetooth(null);},
                        child: Text("2"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                          side: BorderSide(width: 1, color: Colors.black54),)),
                    ElevatedButton(onPressed: () async{_sendMessageToBluetooth("$button4"); await Future.delayed(Duration(milliseconds: 50)); _sendMessageToBluetooth(null);},
                        child: Text("4"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                          side: BorderSide(width: 1, color: Colors.black54),)),
                    ElevatedButton(onPressed: () async{_sendMessageToBluetooth("$button6"); await Future.delayed(Duration(milliseconds: 50)); _sendMessageToBluetooth(null);},
                        child: Text("6"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                          side: BorderSide(width: 1, color: Colors.black54),)),
                    ElevatedButton(onPressed: () async{_sendMessageToBluetooth("$button8"); await Future.delayed(Duration(milliseconds: 50)); _sendMessageToBluetooth(null);},
                        child: Text("8"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                          side: BorderSide(width: 1, color: Colors.black54),)),
                    ElevatedButton(onPressed: () async{_sendMessageToBluetooth("$button0"); await Future.delayed(Duration(milliseconds: 50)); _sendMessageToBluetooth(null);},
                        child: Text("0"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                          side: BorderSide(width: 1, color: Colors.black54),)),
                  ],
                )
              ],
            ),

            IconButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Dialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Color(0xff121212).withOpacity(0.5),
                    child: Container(
                      height: 200,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed: () {
                              showDialog(context: context, builder: (context){
                                return StatefulBuilder(builder: (context, setState){
                                  return BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                    child: Dialog(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                        backgroundColor: Color(0xff121212).withOpacity(0.25),
                                        child: Container(
                                          height: 150,
                                          width: 100,
                                          margin: EdgeInsets.only(top: 20),
                                          child: Column(
                                            children: [
                                              DropdownButton(items: _getDeviceItems(), onChanged: (BluetoothDevice? value) => setState((){_device = value;}), value: _device, style: TextStyle(color: Colors.white), dropdownColor: Color(0xff121212),),
                                              ElevatedButton(child: Text("Connect"), style: ElevatedButton.styleFrom(primary: Colors.teal), onPressed: (){setState(() {_connect(); _connected ? Navigator.pop(context) : null;});},),
                                            ],
                                          ),
                                        )
                                    ),
                                  );
                                });
                              });
                            }, child: Text("Connect to Bot", style: TextStyle(color: Colors.tealAccent))),
                            TextButton(onPressed: () {loadSettings(); Navigator.of(context).push(MaterialPageRoute(builder: (context) => Settings()));}, child: Text("Settings")),
                            TextButton(onPressed: (){_disconnect(); Navigator.pop(context);}, child: Text("Disconnect from Bot", style: TextStyle(color: Colors.redAccent),))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
            },
              icon: _connected ? Icon(Icons.bluetooth_connected_rounded) : Icon(Icons.bluetooth_disabled_rounded),
              color: _connected ? Colors.blueAccent : Colors.redAccent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            )
          ],
        )
    );
  }
}