import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_tracking/config/String.dart';
import 'package:team_tracking/config/color.dart';
import 'package:intl/intl.dart'; // for date format
import 'package:intl/date_symbol_data_local.dart';
import 'package:team_tracking/widget/Listview.dart'; // for other locales
class TeamHeader extends StatefulWidget {
  const TeamHeader({Key? key}) : super(key: key);

  @override
  _TeamHeaderState createState() => _TeamHeaderState();
}

class _TeamHeaderState extends State<TeamHeader> {
  String finalDate = '';
  var list = 10;
  void initState(){
    getCurrentDate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width*1,
        height: size.height*0.2,
        color: color.blackcolor,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Padding(
            //   padding: const EdgeInsets.all(25),
            //   child: Text("$finalDate",style: TextStyle(letterSpacing:letterspacing,fontSize: 25, color:color.yellowcolor,fontFamily: 'Gilroy',fontWeight: FontWeight.w600),),
            // ),
            Container(
              height: size.height*0.12,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Text("All Team",style: TextStyle(letterSpacing:letterspacing,fontSize:16, color:color.yellowcolor,fontFamily: 'Gilroy',fontWeight: FontWeight.w600),),
              ),
            ),

            // Container(
            //   height: 50.0,
            //   child: new ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: new List.generate(31, (int index) {
            //       return Padding(
            //         padding: const EdgeInsets.only(left:20),
            //         child: Container(
            //           width: 50.0,
            //           height: 50.0,
            //           child: new Text("$index",style: TextStyle(color:color.whitecolor,fontSize:18),),
            //         ),
            //       );
            //
            //     }),
            //   ),
            // ),
            // Divider(color:color.whitecolor,thickness:2,),
            Container(
              height: 50.0,
              child: new ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    Container(
                        child: Image(
                            image:AssetImage("assets/images/s29.png")
                        )
                    ),
                    SizedBox(width:10),
                    Container(
                        child: Image(
                            image:AssetImage("assets/images/s30.png")
                        )
                    ),
                    SizedBox(width:10),
                    Container(
                        child: Image(
                            image:AssetImage("assets/images/s31.png")
                        )
                    ),
                    SizedBox(width:10),
                    Container(
                        child: Image(
                            image:AssetImage("assets/images/s33.png")
                        )
                    ),
                    SizedBox(width:10),
                    Container(
                        child: Image(
                            image:AssetImage("assets/images/s32.png")
                        )
                    ),
                    SizedBox(width:10),
                    Container(
                        child: Image(
                            image:AssetImage("assets/images/Socar.png")
                        )
                    )


                  ]
              ),
            ),


          ],
        )
    );
  }
  getCurrentDate(){

    var date = new DateTime.now();
    var formattedDate = DateFormat.yMMMM().format(date);
    setState(() {
      finalDate = formattedDate.toString() ;
      print(finalDate);
    });
  }
}
