import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_tracking/config/Database.dart';
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


  int delid = 0;
  List dataget = [];
  List<bool> chk1 = [];
  final dbHelper = DatabaseHelper.instance;
  fetchdata() async {
    var data = await dbHelper.queryAllRowstable2();
    setState(() {
      dataget=data;
      print("datais"+dataget.toString());
      print(dataget.length);
      chk1 = List.filled(dataget.length, false);
    });
  }
  void initState(){
    fetchdata();
    image = subtractimg;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                                    (chk1 as List<dynamic>).forEach((item) => item = true);
                                    deleteall = true;
                                  });
                                },
                                child: Icon(Icons.delete,color: color.redcolor,)
                            ),
                            Text("All Delete",style: TextStyle(color:color.redcolor),)
                          ],)

                      ),

                    ],
                  )
              ),
            ),

            SingleChildScrollView(
              child: Container(

                  height: MediaQuery.of(context).size.height*0.786,

                  child:Stack(children: [

                    ListView.builder(
                        itemCount: dataget.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15,left: 24,right:0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    chk1[index] == true?
                                    Container(
                                      padding: EdgeInsets.only(right: 24),
                                      child: GestureDetector(onTap: (){
                                        setState(() {
                                          deletedata(delid);
                                          chk1[index]  = false;
                                          deleteall = false;
                                        });
                                        print("hello");
                                      },child: Image.asset(image)),
                                    ):Container(),
                                    Container(
                                      height:size.height*0.2,
                                      width:size.width*0.87,
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
                                                            width:size.width*0.02,
                                                            height:size.height*0.02,
                                                            child: Image.asset(image),
                                                          ),
                                                          SizedBox(
                                                            width:5,
                                                          ),
                                                          Container(
                                                            child: text(dataget[index]['gamename'].toString(), 11, "Gilroy", FontWeight.w500,size.width*0.5),
                                                          )


                                                        ],),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top:6 ,right: 12.0),
                                                        child: Container(
                                                          child: text("time", 11, "Gilroy", FontWeight.w500,size.width*0.15),
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
                                                          child: text(dataget[index]['leuge_name'], 14, "Gilroy",FontWeight.w500,size.width*0.8),
                                                        ),
                                                        // Container(
                                                        //   child: text(dataget[index]['team2'], 14, "Gilroy",FontWeight.w500,size.width*0.4),
                                                        // ),

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
                                                          child:text(dataget[index]['time'], 11, "Gilroy",FontWeight.w400,size.width*0.1),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.only(top:25,right:16),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Container(child: text(dataget[index]['notifytime'], 12, "Gilroy",FontWeight.w600,size.width*0.45))
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
                                indexno = dataget[index]['id'];
                                print(indexno);
                                image = subtractimg;
                                chk1[index]= true;
                                print("tapped");
                                // deleteall = true;
                                delid = dataget[index]['id'];
                              });
                            },
                          );
                        }),

                    deleteall == true ?
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          deletealldata();
                          // notification.clear();
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(top:490,left: 210),
                        child: Image.asset(deleteimage),
                      ),
                    ):Container()
                  ],
                  )
              ),
            )
          ]
      ),
    );
  }
  deletedata(int ids)async{
    final dbHelper = DatabaseHelper.instance;
    final id =  await dbHelper.delete(ids);
    print("deletedata"+ids.toString());
    fetchdata();
  }
  deletealldata()async{
    final dbHelper = DatabaseHelper.instance;
    await dbHelper.deleteall();
    fetchdata();
  }
  Widget text(title,double no,fontfamily,fontweight,width){
    return Container(
      width:width,
      child: Text(title,
          overflow: TextOverflow.ellipsis,
          maxLines:1,
          style: TextStyle(fontSize: no,fontFamily: fontfamily,fontWeight: fontweight)
      ),
    );
  }
}
