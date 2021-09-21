import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_tracking/config/String.dart';
import 'package:team_tracking/config/color.dart';
class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var indexno;
  var subtractimg = "assets/images/Subtract.png";
  var deleteimage = "assets/images/deleteall.png";
  var image = " ";

 bool deleteall = false;
  List notification = [{
    "id":"0",
    "img": "assets/images/s28.png",
    "game": "Football",
    "eventtime": "23.08.2021",
    "team1":"Villarreal",
    "team2":"Real Betis",
    "eventstarttime":"Старт: 17:00",
    "notifytime":"Notify: 2 hours before the event",
    "tapped":false
  },
    {
      "id":"1",
      "img": "assets/images/s28.png",
      "game": "Football",
      "eventtime": "23.08.2021",
      "team1":"Villarreal",
      "team2":"Real Betis",
      "eventstarttime":"Старт: 17:00",
      "notifytime":"Notify: 2 hours before the event",
      "tapped":false
    },
    {
      "id":"2",
      "img": "assets/images/s28.png",
      "game": "Football",
      "eventtime": "23.08.2021",
      "team1":"Villarreal",
      "team2":"Real Betis",
      "eventstarttime":"Старт: 17:00",
      "notifytime":"Notify: 2 hours before the event",
      "tapped":false
    }
  ];
  void initState(){
    image = subtractimg;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       
        children:[

          Container(
            color: color.blackcolor,
            height:MediaQuery.of(context).size.height*0.09,
            width:MediaQuery.of(context).size.width*1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("Notifications",style: TextStyle(letterSpacing:letterspacing,fontSize: 16, color:color.whitecolor,fontFamily: 'Gilroy',fontWeight: FontWeight.w600),),
                  Container(
                      child:Row(children: [
                        GestureDetector(
                            onTap: (){
                            setState(() {
                              (notification as List<dynamic>).forEach((item) => item["tapped"] = true);
                                deleteall = true;
                            });
                            },
                            child: Icon(Icons.delete,color:Colors.red,)
                        ),
                        Text("All Delete",style: TextStyle(color: Colors.red),)
                      ],)

                  ),

                ],
              )
            ),
          ),
       
        SingleChildScrollView(
          child: Container(

            height: MediaQuery.of(context).size.height*0.786,
            decoration: BoxDecoration(
              border: Border.all(color: color.blackcolor)
            ),
            child:Stack(children: [

              ListView.builder(
                  itemCount: notification.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,left: 24,right:0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              notification[index]['tapped'] == true?
                              Container(
                                padding: EdgeInsets.only(right: 24),
                                child: GestureDetector(onTap: (){
                                  setState(() {
                                    notification[index]['tapped']  = false;
                                    deleteall = false;
                                  });
                                  print("hello");
                                },child: Image.asset(image)),
                              ):Container(),
                              Container(

                                height:118,
                                width:312,
                                child: Card(
                                    color: color.cardcolor,
                                    child:Column(
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.only(top:18,left:16),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Container(
                                                  child: Row(children: [
                                                    Container(
                                                      width:10,
                                                      height: 10,
                                                      child: Image.asset(notification[index]['img']),
                                                    ),
                                                    SizedBox(
                                                      width:5,
                                                    ),
                                                    Container(
                                                      child: text(notification[index]['game'], 11, "Gilroy", FontWeight.w500),
                                                    )


                                                  ],),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top:6 ,right: 12.0),
                                                  child: Container(
                                                    child: text(notification[index]['eventtime'], 11, "Gilroy", FontWeight.w500),
                                                  ),
                                                ),


                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:10,left:16),
                                            child: Container(

                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start ,
                                                children: [
                                                  Container(
                                                    child: text(notification[index]['team1']+"-", 14, "Gilroy",FontWeight.w500),
                                                  ),
                                                  Container(
                                                    child: text(notification[index]['team2'], 14, "Gilroy",FontWeight.w500),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ),


                                          Padding(
                                            padding: const EdgeInsets.only(left: 16,),
                                            child: Container(

                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start ,
                                                children: [
                                                  Container(
                                                    child:text(notification[index]['eventstarttime'], 11, "Gilroy",FontWeight.w400),
                                                  ),


                                                ],
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(top:13.0,right:16),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Container(child: text(notification[index]['notifytime'], 12, "Gilroy",FontWeight.w600))
                                              ],
                                            ),
                                          )
                                        ]
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onLongPress: (){
                        setState(() {
                         indexno = int.parse(notification[index]['id']) ;
                         print(indexno);
                          image = subtractimg;
                          notification[index]['tapped'] = true;
                          print("tapped");
                          deleteall = true;

                        });
                      },
                    );
                  }),
              deleteall == true ?
              GestureDetector(
                onTap: (){
                  setState(() {
                      notification.removeAt(indexno);
                      // notification.clear();
                      print("all check");
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top:470,left: 210),
                  child: Image.asset(deleteimage),
                ),
              ):Container()
            ],)

          ),
        )
        ]
      ),
    );
  }
 Widget  text(title,double no,fontfamily,fontweight){
    return Text(title,style: TextStyle(fontSize: no,fontFamily: fontfamily,fontWeight: fontweight));
  }
}
