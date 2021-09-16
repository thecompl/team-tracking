import 'package:flutter/material.dart';
import 'package:team_tracking/screen/Event.dart';
import 'package:team_tracking/screen/Notification.dart';
import 'package:team_tracking/config/color.dart';
import 'Teams.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  PageController _pageController = PageController();



  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 400));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(


        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Event(),
            Teams(),
            Notifications()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(

          selectedItemColor:color.bottomnavigationiconcolor,
          unselectedItemColor:color.whitecolor,
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
          onTap:(index) =>  onTabTapped(index),
        ),

      ),
    );
  }
}
