import 'package:flutter/material.dart';
import 'package:team_tracking/config/color.dart';
class Popup extends StatefulWidget {
  const Popup({Key? key}) : super(key: key);

  @override
  _PopupState createState() => _PopupState();
}

class RadioList {
  String name;
  int index;
  RadioList({required this.name, required this.index});
}
class _PopupState extends State<Popup> {
  int id = 0;
  List<RadioList> RList = [
    RadioList(
      index: 1,
      name: "Half an hour before the event",
    ),
    RadioList(
      index: 2,
      name: "1 hours before the event",
    ),
    RadioList(
      index: 3,
      name: "2 hours before the event",
    ),
    RadioList(
      index: 4,
      name: "3 hours before the event",
    ),
    RadioList(index: 5, name: "4 hours before the event")
  ];
  @override
  Widget build(BuildContext context) {
    return alert();
  }
   alert(){
    return AlertDialog(
               title: Text("Notify me.....",
                   style: TextStyle(
                     fontFamily: "Gilroy",
                     fontSize: 16,
                     fontWeight: FontWeight.w600,
                   )),
               actions: <Widget>[
                 TextButton(
                   child: Text('Cancel',
                       style: TextStyle(
                         color: color.popupbtncolor,
                         fontFamily: "Gilroy",
                         fontSize: 14,
                         fontWeight: FontWeight.w600,
                       )),
                   onPressed: () {
                     Navigator.of(context).pop();
                   },
                 ),
                 TextButton(
                   child: Text('Notify me',
                       style: TextStyle(
                           color: color.popupbtncolor,
                           fontFamily: "Gilroy",
                           fontSize: 14,
                           fontWeight:
                           FontWeight.w600)),
                   onPressed: () {
                     Navigator.of(context).pop();
                   },
                 ),
               ],
               content: StatefulBuilder(
                 builder: (BuildContext context,
                     StateSetter setState) {
                   return Container(
                     height: 360,
                     child: Column(
                       children: RList.map((data) =>
                           RadioListTile(
                             title: Text(
                                 "${data.name}",
                                 style: TextStyle(
                                   fontFamily:
                                   "Gilroy",
                                   fontSize: 16,
                                   fontWeight:
                                   FontWeight.w400,
                                 )),
                             groupValue: id,
                             value: data.index,
                             onChanged: (val) {
                               setState(() {
                                 id = data.index;
                               });
                             },
                           )).toList(),
                     ),
                   );
                 },
               ),
             );
  }
}
