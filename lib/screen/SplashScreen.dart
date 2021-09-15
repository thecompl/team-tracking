import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:team_tracking/config/String.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/screen/Events.dart';
import 'package:team_tracking/screen/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AnimatedSplashScreen(
        backgroundColor:color.blackcolor,
        splash:Center(child:
        Text('Team Tracking',style: TextStyle(color:color.whitecolor,fontFamily:'Gilroy',fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: letterspacing))
        ),
        nextScreen:Login(),
        splashTransition:SplashTransition.scaleTransition,
      ),
    );
  }
}