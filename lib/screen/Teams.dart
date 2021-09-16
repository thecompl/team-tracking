import 'package:flutter/material.dart';
import 'package:team_tracking/config/String.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/widget/Header.dart';
import 'package:team_tracking/widget/ImageList.dart';
import 'package:team_tracking/widget/MonthYear.dart';
import 'package:team_tracking/widget/TeamHeader.dart';
class Teams extends StatefulWidget {
  const Teams({Key? key}) : super(key: key);

  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          height: size.height*0.128,

          decoration: BoxDecoration(
              color: color.blackcolor,
            border:Border.all(color: Colors.black)
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Padding(
          padding: const EdgeInsets.all(10),
          child: Text("All Team",style: TextStyle(letterSpacing:letterspacing,fontSize: 16, color:color.yellowcolor,fontFamily: 'Gilroy',fontWeight: FontWeight.w600),),
        ),
                ImageList()
              ],
            ),

        ),
      );

  }
}
