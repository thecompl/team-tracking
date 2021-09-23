import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/screen/Notification.dart';
import 'package:team_tracking/screen/Teams.dart';
import 'package:team_tracking/widget/Popup.dart';
import 'package:team_tracking/widget/Textfield.dart';

class Match extends StatefulWidget {
  const Match({Key? key}) : super(key: key);

  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {
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
        body:
        PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: size.height * 0.39,
                  color: color.blackcolor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: color.whitecolor,
                                ),
                              )),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Image.asset(
                                      "assets/images/footballicon.png",
                                      width: 10,
                                      height: 10,
                                    )),
                                Textfield().text("Football", 11, FontWeight.w500,
                                    color.datecolor,50)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Popup();
                                    });
                              },
                              child: Card(
                                  color: color.belliconbackcolor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.notifications,
                                      color: color.yellowcolor,
                                      size: 12,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 23),
                        child: Row(
                          children: [
                            Textfield().text("Spain,La Liga", 16, FontWeight.w500,
                                color.whitecolor,110)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20, left: 50),
                              child: Container(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: color.teambackcolor,
                                      ),
                                      Container(
                                        height: 63,
                                        width: 63,
                                        child: Card(
                                            color: color.teambackcolor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                  "assets/images/teamicon1.png",
                                                  width: 49.6,
                                                  height: 42.89,
                                                ))),
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Textfield().text("Real Betis", 16,
                                              FontWeight.w500, color.whitecolor,80))
                                    ],
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                children: [
                                  Container(
                                      child: Textfield().text("17:00", 16,
                                          FontWeight.w600, color.whitecolor,40)),
                                  Container(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Textfield().text("22.08.2021", 11,
                                          FontWeight.w500, color.datecolor,60)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Container(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: color.teambackcolor,
                                      ),
                                      Container(
                                        height: 63,
                                        width: 63,
                                        child: Card(
                                            color: color.teambackcolor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                  "assets/images/teamicon1.png",
                                                  width: 49.6,
                                                  height: 42.89,
                                                ))),
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Textfield().text("Villarreal", 16,
                                              FontWeight.w500, color.whitecolor,80))
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 230, top: 20),
                            child: Textfield().text("Winning odds", 16, FontWeight.w500, color.blackcolor,130)),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width * 0.48,
                                height: MediaQuery.of(context).size.height * 0.09,
                                child: Card(
                                  color: color.cardcolor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text("T1")),
                                      Container(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Text("1.85"))
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.48,
                                height: MediaQuery.of(context).size.height * 0.09,
                                child: Card(
                                  color: color.cardcolor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text("T2")),
                                      Container(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Text("1.85"))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
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
