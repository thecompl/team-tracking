

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiver/time.dart';
import 'package:team_tracking/config/color.dart';

class DateScroll extends StatefulWidget {
  const DateScroll({Key? key}) : super(key: key);

  @override
  _DateScrollState createState() => _DateScrollState();
}

class _DateScrollState extends State<DateScroll> {
  @override
  Widget build(BuildContext context) {
    return Monthdays();
  }
}
Monthdays() {
  final _height = 20.0;
  final _controller = ScrollController();
  _animateToIndex(i) => _controller.animateTo(_height * i, duration: Duration(seconds: 2), curve: Curves.linear);
  return Row(children: [
    GestureDetector(
      onTap:(){ _animateToIndex(5);},
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Icon(
          Icons.arrow_back_ios,
          size: 15,
          color: color.whitecolor,
        ),
      ),
    ),

 Container(
    margin: EdgeInsets.only(left:10),
        height: 16,
        width: 300,
        child: ListView.builder(
            controller: _controller,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
            return Listcalender();
             // List.generate(dayinmonth + 1, (int index) {
             //    return Padding(
             //      padding: const EdgeInsets.only(left: 10),
             //      child: Container(
             //        width: 30.0,
             //        height: 50.0,
             //        child: new Text(
             //          "$index",
             //          style: TextStyle(color: color.whitecolor, fontSize: 12),
             //        ),
             //      ),
             //    );
             //  });
            }),
          // child: new ListView(
        //   scrollDirection: Axis.horizontal,
        //   children: new List.generate(dayinmonth+1,(int index) {
        //     return Padding(
        //       padding: const EdgeInsets.only(left:10),
        //       child: Container(
        //         width: 30.0,
        //         height: 50.0,
        //         child: new Text("$index",style: TextStyle(color:color.whitecolor,fontSize:12),),
        //       ),
        //     );
        //
        //   }),
        // ),
      ),

    GestureDetector(
      onTap: (){_animateToIndex(5);},
      child: Padding(
        padding: const EdgeInsets.only(left: 9),
        child: Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: color.whitecolor,
        ),
      ),
    ),
  ]);

}

Listcalender(){
  String finalmonth = '';
  String finalyear = '';
  var date = new DateTime.now();
  var formatemonth = DateFormat.M().format(date);
  var formateyear = DateFormat.y().format(date);
  finalmonth = formatemonth.toString();
  finalyear = formateyear.toString();
  var month = int.parse(finalmonth);
  var year = int.parse(finalyear);
  print(finalmonth);
  print(finalyear);
  var dayinmonth = daysInMonth(year, month);


  return Container(
    height: 100,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: new List.generate(dayinmonth+1,(int index ) {
        return Padding(
          padding: const EdgeInsets.only(left:10),
          child: Container(
            width: 30.0,
            height: 50.0,
            child: new Text("$index",style: TextStyle(color:color.whitecolor,fontSize:12),),
          ),
        );

      }),
    ),
  );

}

