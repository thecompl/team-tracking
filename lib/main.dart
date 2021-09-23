
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:team_tracking/screen/SplashScreen.dart';
import 'package:team_tracking/widget/DateScroll.dart';
void main(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(Myapp());
}
class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  void initState(){

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SplashScreen(),
    );
  }
}
