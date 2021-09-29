import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:team_tracking/Api/Api.dart';
import 'package:team_tracking/Api/Url.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/screen/Home.dart';
import 'package:team_tracking/screen/Notification.dart';
import 'package:team_tracking/screen/Teams.dart';
import 'package:team_tracking/widget/Listview.dart';

class Teamevent extends StatefulWidget {
 final int team_id;
 final  game_name;
 final team_name;
 final cc;
 final fav;
  const Teamevent({Key? key ,required this.team_id,required this.game_name,required this.team_name, this.cc, this.fav}) : super(key: key);

  @override
  _TeameventState createState() => _TeameventState();
}

class _TeameventState extends State<Teamevent> {
  List apidata = [];
  List list = [];
  String cname='';
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  int team_id=0;

  var gamename;
  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        curve: Curves.easeIn, duration: Duration(milliseconds: 400));
  }
  void initState(){
    getdata();
    setState(() {
    team_id = widget.team_id;
    gamename = widget.game_name;
    });
    super.initState();
  }

  getdata() async{

    String jsonCompany = await rootBundle.loadString("assets/Country.json");
    var resBody = json.decode(jsonCompany);
    setState(() {
      list = resBody;

    });

    if(widget.cc!='') {
      List results = list
          .where((user) =>
          user["code"].toLowerCase().contains(widget.cc.toLowerCase()))
          .toList();
      setState(() {
        cname = results[0]['name'].toString();
      });

    }

  }
  apicall() async {
    setState(() {
      apidata = [];
    });

    await Api()
        .apicall(
        url.baseurl+"&sport=&team=85097&p=1")
        .then((value) {

        if (value['games_pre'].length > 0) {
          setState(() {
            apidata = value['games_pre'];
          });
        } else {
          setState(() {
            apidata = [];
          });

      }
      }


    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body:PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Column(
              children: [
                Container(
                  height:size.height*0.35,
                  color: color.blackcolor,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>Home()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left:20),
                                child: Icon(Icons.arrow_back,color: color.whitecolor,),
                              )
                          ),
                          Container(
                            padding: EdgeInsets.only(left:100),
                            child: Row(
                              children: [
                                Container(
                                    padding:EdgeInsets.only(right: 5),
                                    child: Image.asset("assets/images/footballicon.png",width:10,height:10,)),
                                Text("Football", style: TextStyle(
                                    fontFamily: "Gilroy",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: color.datecolor)),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:40),
                        child: Center(
                          child: Column(
                            children: [
                              widget.fav==1?
                          Icon(Icons.star,color: color.yellowcolor,):

                                        Icon(Icons.star,color: color.teambackcolor,),
                                        Container(
                                          height:size.height*0.1,
                                          width: size.width*0.2,
                                          child: Card(
                                              color: color.teambackcolor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child:
                                                  CachedNetworkImage(
                                                      imageUrl:url.teamimgurl+gamename+"/"+team_id.toString()+".png",
                                                    width: 49.6,
                                                    height: 42.89,
                                                    errorWidget:(context, url, error) => Image.asset("assets/images/nullimg.png") ,
                                                  ),

                                              )),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top:20),
                                          child: Text(widget.team_name, style: TextStyle(
                                              fontFamily: "Gilroy",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: color.whitecolor)),),

                                        Container(child: Text("${widget.team_name},$cname", style: TextStyle(
                                            fontFamily: "Gilroy",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: color.cardcolor)),
                                        )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height*0.07,
                  padding: EdgeInsets.only(top:20,right:200),
                  child: Text("Upcoming events",style: TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                Divider(thickness:2),
                Container(
                    height:size.height*0.4                                                                                       ,
                    child: Listview(gamename:gamename,team:team_id)
                ),
              ],
            ), Teams(), Notifications()
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: color.bottomnavigationiconcolor,
          unselectedItemColor: color.whitecolor,
          backgroundColor: color.blackcolor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Teams',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) => onTabTapped(index),
        ),

      ),
    );
  }
}
