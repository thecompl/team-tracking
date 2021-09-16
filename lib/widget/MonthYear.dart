import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_tracking/config/String.dart';
import 'package:team_tracking/config/color.dart';
class MonthYear extends StatefulWidget {
  const MonthYear({Key? key}) : super(key: key);

  @override
  _MonthYearState createState() => _MonthYearState();
}

class _MonthYearState extends State<MonthYear> {
  String finalDate = '';
  var list = 10;
  void initState(){
    super.initState();
    getCurrentDate();
  }
  @override
  Widget build(BuildContext context) {
    return monthyear();
  }

  monthyear(){
    return
      Padding(
        padding: const EdgeInsets.all(25),
        child: Text("$finalDate",style: TextStyle(letterSpacing:letterspacing,fontSize: 14, color:color.yellowcolor,fontFamily: 'Gilroy',fontWeight: FontWeight.w600),),
      );
  }
  getCurrentDate(){

    var date = new DateTime.now();
    var formattedDate = DateFormat.yMMMM().format(date);

    finalDate = formattedDate.toString() ;
    print(finalDate);

  }
}

