import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:quiver/time.dart';
import 'package:team_tracking/config/Database.dart';
import 'package:team_tracking/config/color.dart';
class Popup extends StatefulWidget {

  final  leuge_name;
  final  game_name;
  final  time;
  final  game_id;
  final  team_name1;
  final  team_name2;

  const Popup({Key? key, required this.leuge_name, required this.game_name, required this.time,this.game_id, this.team_name1, this.team_name2}) : super(key: key);

  @override
  _PopupState createState() => _PopupState();
}

class RadioList {
  String name;
  int index;
  RadioList({required this.name, required this.index});
}
class _PopupState extends State<Popup> {
  int minut = 0 ;
  String radio_data='';
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
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  var ctime;
  void initState(){

    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');

    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings();

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: null);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification:selectNotification);

    setState(() {

     ctime = widget.time;
    });
    super.initState();
  }
  shownotification() async {

    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Desi programmer", "This is my channel",
        importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
    new NotificationDetails(android: androidDetails, iOS: iSODetails);
    //
    // await flutterLocalNotificationsPlugin.show(
    //     0, "Task", "You created a Task",
    //     generalNotificationDetails, payload: "Task");

     var scheduledDate = DateTime.now().add(Duration(minutes:minut));
     flutterLocalNotificationsPlugin.schedule(id, "Task", "You created a Task", scheduledDate, generalNotificationDetails, payload: "Task");
  }
  @override
  Widget build(BuildContext context) {
    return alert();
  }
  Future selectNotification(payload) async {
    //Handle notification tapped logic here
  }
   alert(){

    print(widget.time);
    var onlytime= DateFormat.Hm().parse(widget.time);
    print("times"+onlytime.toString());
    print(onlytime.runtimeType);

    // var timetime = DateFormat.Hm().format(onlytime);
    //
    // print("formatetime" +DateTime.parse(timetime).toString());

    // DateTime finaltime = DateTime(onlytime.hour,onlytime.minute);
    // print("finaltime"+finaltime.toString());




    var size=MediaQuery.of(context).size;
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
                       _inserttable2(widget.game_id,widget.game_name,widget.time,widget.leuge_name, widget.team_name1,widget.team_name2);
                       DateTime fiftyDaysAgo = onlytime.subtract(Duration(minutes:minut));
                       print("subttime"+fiftyDaysAgo.toString());
                       shownotification();
                       Navigator.of(context).pop();
                     },
                   ),

               ],
               content: StatefulBuilder(
                 builder: (BuildContext context,
                     StateSetter setState) {
                   return Container(
                     height:size.height*0.4,
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
                                 if(data.index == 1){
                                   minut = 1;
                                 }else if(data.index == 2){
                                   minut = 2;
                                 }else if(data.index == 3){
                                   minut = 3;
                                 }else if(data.index == 4){
                                   minut = 4;
                                 }else if(data.index == 5){
                                   minut=60;
                                 }
                                 id = data.index;
                                 radio_data=data.name;
                               });
                             },
                           )).toList(),
                     ),
                   );
                 },
               ),
             );
  }
  final dbHelper = DatabaseHelper.instance;



  void _inserttable2(String game_id,Gamename, timer,leuge_name,String teamname1,String teamname2) async {

    // row to insert
      Map<String, dynamic> row = {
      DatabaseHelper.game_id  : game_id,
      DatabaseHelper.gamename  : Gamename,
      DatabaseHelper.time  : timer,
      DatabaseHelper.leuge_name  : leuge_name,
      DatabaseHelper.team1  : teamname1,
      DatabaseHelper.team2  : teamname2,
      DatabaseHelper.notifytime  :radio_data,
      DatabaseHelper.tapped  :0,
      DatabaseHelper.date :

    };
    final id = await dbHelper.inserttable2(row);
    print('inserted row id: $id');
  }
}
