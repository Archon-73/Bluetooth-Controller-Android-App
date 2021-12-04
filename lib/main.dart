import 'package:bluetooth_controller/file_storage_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'controller.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]); //Setting Orientation
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); //Removing Status Bar and Navigation Bar

    runApp(MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          backgroundColor: Color(0xff121212),
          splash: Image.asset('assets/TTA-Logo.png', fit: BoxFit.cover,),
          animationDuration: Duration(seconds: 1, milliseconds: 500),
          splashTransition: SplashTransition.slideTransition,
          pageTransitionType: PageTransitionType.fade,
          nextScreen: Start(),
        )
        )
    );
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              getVisitingStatus();
              if(alreadyVisited == false || prefs.containsKey('alreadyVisited') == false){
                restoreToDefaults();
                Future.delayed(const Duration(milliseconds: 50));
                loadSettings();
                setVisitingStatus();
              }else{
                Future.delayed(const Duration(milliseconds: 50));
                loadSettings();
              }
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Controller()));
            },
            icon: const Icon(Icons.play_arrow),
            label: const Text("ENTER", style: TextStyle(fontSize: 30),),
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.black26,
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0), side: BorderSide(width: 5, color: Colors.black54),),
              padding: EdgeInsets.fromLTRB(20,20,30,20),
              primary: Colors.deepPurpleAccent
            ),
        ),
      ),
    );
  }
}
