import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:team_tracking/screen/SplashScreen.dart';
import 'package:team_tracking/widget/DateScroll.dart';
import 'package:team_tracking/widget/notificationHelper.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );

  }

}
