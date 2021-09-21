import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_tracking/config/color.dart';
class Match extends StatefulWidget {
  const Match({Key? key}) : super(key: key);

  @override
  _MatchState createState() => _MatchState();
}
class _MatchState extends State<Match> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            Container(
              width: 1000,
              height:287,
              color: color.blackcolor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.only(right: 5),
                                child: Image.asset("assets/images/footballicon.png",width:10,height:10,)),
                            Text("Football", style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: color.datecolor)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Card(
                          color: color.belliconbackcolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.notifications,color: color.yellowcolor,size:15,),
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20,left:23),
                    child: Row(
                      children: [
                        Text("Spain,La Liga", style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: color.whitecolor))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:40),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20,left: 50),
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
                                    padding: EdgeInsets.only(top:10),
                                    child: Text("Real Betis", style: TextStyle(
                                      fontFamily: "Gilroy",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: color.whitecolor)),)
                                ],
                              )

                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Container(

                                child: Text("17:00", style: TextStyle(
                                    fontFamily: "Gilroy",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                     color: color.whitecolor )),
                              ),
                              Container(
                                padding: EdgeInsets.only(top:5),
                                child: Text("22.08.2021", style: TextStyle(
                                    fontFamily: "Gilroy",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: color.datecolor)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:30),
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
                                    padding: EdgeInsets.only(top:10),
                                    child: Text("Villarreal", style: TextStyle(
                                      fontFamily: "Gilroy",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: color.whitecolor)),)
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

              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:230,top:20),
                    child: Text("Winning odds", style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: color.blackcolor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:5),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left:10),
                          width: MediaQuery.of(context).size.width*0.48,
                          height: MediaQuery.of(context).size.height*0.09,
                          child: Card(
                            color: color.cardcolor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left:5),
                                    child: Text("T1")),
                                Container(
                                    padding: EdgeInsets.only(right:5),
                                    child: Text("1.85"))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.48,
                          height: MediaQuery.of(context).size.height*0.09,
                          child: Card(
                            color: color.cardcolor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left:5),
                                    child: Text("T2")),
                                Container(
                                    padding: EdgeInsets.only(right:5),
                                    child: Text("1.85"))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )

            ),
          ],
        ),
      ),
    );
  }
}
