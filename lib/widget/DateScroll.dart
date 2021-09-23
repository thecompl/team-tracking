import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiver/collection.dart';
import 'package:quiver/time.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/widget/Textfield.dart';

class DateScroll extends StatefulWidget {
  const DateScroll({Key? key}) : super(key: key);

  @override
  _DateScrollState createState() => _DateScrollState();
}

class _DateScrollState extends State<DateScroll> {
  void initState(){

  }
  @override
  Widget build(BuildContext context) {
    return Monthdays();
  }
}

Monthdays() {
  int itemsize = 130;

  var formatemonth = DateFormat.M().format(DateTime.now());
  var formateyear = DateFormat.y().format(DateTime.now());
  var current_d = DateFormat.d().format(DateTime.now());
  var dayinmonth = daysInMonth(int.parse(formateyear.toString()), int.parse(formatemonth.toString()));
  final _controller = ScrollController();


  _moveright() {
    _controller.animateTo(_controller.offset - itemsize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }
  _moveleft() {
    _controller.animateTo(_controller.offset + itemsize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  return Container(
    padding: EdgeInsets.only(bottom:4),
    child: Row(children: [
      GestureDetector(
        onTap: () {
          _moveright();
        },
        child: Padding(
          padding: const EdgeInsets.only(left:16),
          child: Icon(
            Icons.arrow_back_ios,
            size: 19,
            color: color.whitecolor,
          ),
        ),
      ),

      Container(
        margin: EdgeInsets.only(left: 10),
        height: 33,
        width: 280,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: dayinmonth,
            itemBuilder: (BuildContext context, int index) {
              var date = index + 1;
             int cdate =int.parse(current_d);

              var focus = cdate == date?true:false;
              print(focus);

              return  Padding(
                padding: const EdgeInsets.only(left:9),
                child: Container(

                  width: 30.0,
                  height: 50.0,
                  child: focus == true ?
                  Stack(
                    children: [

                      Container(
                        color: color.yellowcolor,
                        height:33,
                        width:33,
                      ),
                      Center(
                        child: Container(
                            child:Textfield().text("$date", 14, FontWeight.w500, color.blackcolor,20)

                        ),
                      ),
                    ],
                  ):
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        child: Textfield().text("$date",12,FontWeight.w600, color.whitecolor,20)

                      ),
                    ],
                  )
                ),
              );

            }),
      ),
      GestureDetector(
        onTap: () {
          _moveleft();
        },
        child: Padding(
          padding: const EdgeInsets.only(left:10),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 19,
            color: color.whitecolor,
          ),
        ),
      ),
    ]),
  );
}


