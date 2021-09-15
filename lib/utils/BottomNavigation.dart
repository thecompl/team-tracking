// import 'package:flutter/material.dart';
// import 'package:team_tracking/config/color.dart';
// import 'package:team_tracking/screen/Events.dart';
// import 'package:team_tracking/screen/Notification.dart';
// import 'package:team_tracking/screen/Teams.dart';
// import 'package:team_tracking/screen/login.dart';
//
//
// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({Key? key}) : super(key: key);
//
//   @override
//   _BottomNavigationState createState() => _BottomNavigationState();
// }
//
// class _BottomNavigationState extends State<BottomNavigation> {
//   int _selectedIndex = 0;
//
//   PageController _pageController = PageController();
//   static const TextStyle optionStyle =
//   TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//
//   void onTabTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     _pageController.animateToPage(index,
//         curve: Curves.easeIn,
//         duration: Duration(milliseconds: 400));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: PageView(
//         controller: _pageController,
//         children: <Widget>[
//           Teams(),
//           Notifications()
//           ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//
//         selectedItemColor:color.bottomnavigationiconcolor,
//         unselectedItemColor:color.whitecolor,
//         backgroundColor: color.blackcolor,
//
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Events',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.group),
//             label: 'Teams',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'Notifications',
//           ),
//         ],
//
//         currentIndex: _selectedIndex,
//         onTap:(index) =>  onTabTapped(index),
//       ),
//     );
//   }
// }
