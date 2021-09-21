import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_tracking/config/String.dart';
import 'package:team_tracking/config/color.dart';
import 'package:intl/intl.dart'; // for date format
import 'package:intl/date_symbol_data_local.dart';
import 'package:team_tracking/widget/DateScroll.dart';
import 'package:team_tracking/widget/ImageList.dart';
import 'package:team_tracking/widget/Listview.dart';
import 'package:team_tracking/widget/MonthYear.dart'; // for other locales
class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}
class _HeaderState extends State<Header> {
  String finalDate = '';
  var list = 10;

  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
        width: size.width * 1,
        height: size.height * 0.170,
        color: color.blackcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MonthYear(),
            DateScroll(),
            Divider(color: color.whitecolor, thickness: 2,),
            ImageList()
          ],
        )
    );
  }

}
