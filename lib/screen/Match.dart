import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_tracking/Api/Api.dart';
import 'package:team_tracking/Api/Url.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/screen/Notification.dart';
import 'package:team_tracking/screen/Teamevent.dart';
import 'package:team_tracking/screen/Teams.dart';
import 'package:team_tracking/widget/Popup.dart';
import 'package:team_tracking/widget/Textfield.dart';
import 'package:team_tracking/widget/loading.dart';

class Match extends StatefulWidget {
 final int game_id;
 final List list;
  const Match({Key? key, required this.game_id, required this.list}) : super(key: key);

  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {
  int _selectedIndex = 0;
  List apidata = [];
  String GameId='';
  String GameDate='';
  String GameTask='';

  PageController _pageController = PageController();

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        curve: Curves.easeIn, duration: Duration(milliseconds: 400));
  }
  var mylist=[];
  void initState() {
    super.initState();
    setState(() {
        print(widget.game_id.toString());
        mylist=widget.list;
        GameTask='odds';
        GameId = widget.game_id.toString();

    });
    apicall();
  }

  apicall() async {
    await Api().apicall(url.baseurl+"&task=$GameTask&game_id=$GameId").then((value) {
            print("data=="+value['odds']['Bet365']['live'].toString());
              apidata=value['odds']['Bet365']['live'];
        });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                                    child:
                                    Image.asset(
                                      "assets/images/footballicon.png",
                                      width: size.width*0.04,
                                      height:size.height*0.03,
                                    )),

                                Textfield().text(widget.list[0], 11, FontWeight.w500,
                                    color.datecolor,80)
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
                                      return Popup(time:mylist[6], leuge_name:mylist[1], game_name:mylist[0],);
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
                            Textfield().text(mylist[1], 16, FontWeight.w500,
                                color.whitecolor,size.width*0.9)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 45),
                              child: Container(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: color.teambackcolor,
                                      ),
                                      Container(
                                        height: size.height*0.1,
                                        width: size.width*0.2,
                                        child: Card(
                                            color: color.teambackcolor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: CachedNetworkImage(
                                                 imageUrl: url.teamimgurl+mylist[0]+"/"+mylist[2]+".png",
                                                  width: size.width*0.2,
                                                  height: size.height*0.2,
                                                  errorWidget: (context, url, error) => Image.asset("assets/images/nullimg.png"),
                                                ))),
                                      ),
                                      Container(

                                          padding: EdgeInsets.only(top: 10),
                                          child: Textfield().text(mylist[3], 16,
                                              FontWeight.w500, color.whitecolor,size.width*0.25))
                                    ],
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.only(left:30),
                              child: Column(
                                children: [
                                  Container(

                                      child: Textfield().text(mylist[6], 16,
                                          FontWeight.w600, color.whitecolor,size.width*0.15)),
                                  Container(

                                      padding: EdgeInsets.only(top: 5),
                                      child: Textfield().text(mylist[7], 11,
                                          FontWeight.w500, color.datecolor,size.width*0.15)),
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
                                        height: size.height*0.1,
                                        width: size.width*0.2,
                                        child: Card(
                                            color: color.teambackcolor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: CachedNetworkImage(
                                                 imageUrl: url.teamimgurl+mylist[0]+"/"+mylist[4]+".png",
                                                  width: size.width*0.2,
                                                  height: size.height*0.2,
                                                  errorWidget: (context, url, error) => Image.asset("assets/images/nullimg.png"),
                                                ))),
                                      ),
                                      Container(

                                          padding: EdgeInsets.only(top: 10),
                                          child: Textfield().text(mylist[5], 16,
                                              FontWeight.w500, color.whitecolor,size.width*0.2))
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
                Padding(
                    padding: const EdgeInsets.only(left:5, top: 20),
                    child: Textfield().text("Winning odds",17, FontWeight.w500, color.blackcolor,size.width)),
                Container(
                  height: size.height*0.4,
                  child: ListView.builder(

                      itemCount: apidata.length < 0 ? apidata.length : 3,
                      itemBuilder: (BuildContext context, index){

                        if(apidata.isEmpty) return Loadingcard();
                       return Container(
                           padding: const EdgeInsets.only(top:10),
                           child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Row(
                                    children: [
                                      Container(

                                        padding: EdgeInsets.only(left:5,right: 5),
                                        width: MediaQuery.of(context).size.width * 0.5,
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
                                                  child: Text(apidata[index]['home_od'].toString()))
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
                                                  child: Text(apidata[index]["away_od"].toString()))
                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ));
                      }
                  ),
                )

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
