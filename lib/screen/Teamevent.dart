import 'package:flutter/material.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/screen/Notification.dart';
import 'package:team_tracking/screen/Teams.dart';
import 'package:team_tracking/widget/Listview.dart';
class Teamevent extends StatefulWidget {
  const Teamevent({Key? key}) : super(key: key);

  @override
  _TeameventState createState() => _TeameventState();
}

class _TeameventState extends State<Teamevent> {
  int _selectedIndex = 0;

  PageController _pageController = PageController();

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        curve: Curves.easeIn, duration: Duration(milliseconds: 400));
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                                Navigator.pop(context);
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
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:130),
                              child: Container(

                                  child: Column(
                                    children: [
                                      Icon(Icons.star,color: color.teambackcolor,),
                                      Container(
                                        height:63,
                                        width: 63,
                                        child: Card(
                                            color: color.teambackcolor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Image.asset("assets/images/teamicon1.png",width: 49.6,height: 42.89,)
                                            )),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top:20),
                                        child: Text("Real Betis", style: TextStyle(
                                            fontFamily: "Gilroy",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: color.whitecolor)),),
                                      Container(child: Text("Real Betis,Spain", style: TextStyle(
                                          fontFamily: "Gilroy",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: color.cardcolor)),)
                                    ],
                                  )

                              ),

                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
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
                    child: Listview()
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
