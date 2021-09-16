import 'package:flutter/material.dart';
import 'package:team_tracking/widget/Header.dart';
import 'package:team_tracking/widget/Listview.dart';
class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

          child: Column(
            children: [
              Header(),
              Listview()
            ],
          ),

      ),
    );
  }
}
