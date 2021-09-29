import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:team_tracking/Api/Api.dart';
import 'package:team_tracking/Api/Url.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/screen/Match.dart';
import 'package:team_tracking/screen/Teamevent.dart';
import 'package:team_tracking/widget/Popup.dart';
import 'package:team_tracking/widget/Textfield.dart';
import 'package:team_tracking/widget/bloc.dart';
import 'package:team_tracking/widget/loading.dart';




class Listview extends StatefulWidget {

final String gamename;
final int team;
  const Listview({Key? key, required this.gamename, required this.team}) : super(key: key);
  @override
  _ListviewState createState() => _ListviewState();

}

class _ListviewState extends State<Listview> {
  var teamname;
  List data = [];
  String Gamename='';
  var formatemonth = DateFormat.M().format(DateTime.now());
  var formateyear = DateFormat.y().format(DateTime.now());
  var current_d = DateFormat.d().format(DateTime.now());

  void initState() {
    super.initState();
    apicall(widget.gamename,widget.team);
  }

  apicall(gamename, team_id) async {
    print("https://spoyer.ru/api/get.php?login=ayna&token=12784-OhJLY5mb3BSOx0O&task=predatapage&sport=$gamename&team=$team_id&p=1");
    await Api()
        .apicall(
            "https://spoyer.ru/api/get.php?login=ayna&token=12784-OhJLY5mb3BSOx0O&task=predatapage&sport=$gamename&team=$team_id&p=1")
        .then((value) {

      if (value['games_pre'].length > 0) {

        setState(() {
          data = value['games_pre'];

        });
      } else {
        setState(() {
          data = [];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.675,
        child: ListView.builder(
            itemCount: data.length > 0 ? data.length:5,
            itemBuilder: (BuildContext context, int index) {
              if(data.isEmpty) return Loadingcard();
              return new ExpansionTile(
                  title: leagetitle(data, index, context),
                  children: _buildExpandableContent(index));
            }),
      ),
    );
  }

  _buildExpandableContent(index) {
    print("imageteam=="+url.teamimgurl+"soccer/"+data[index]['home']['id']+".png");
    var size = MediaQuery.of(context).size;
    List<Widget> columnContent = [];
    columnContent.add(Container(
        height:size.height*0.230,
        width:size.width*360,
        child: GestureDetector(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => Match()),
            // );
          },
          child: Card(
              color: color.tmpcardcolor,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 23,top: 20,right: 23),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Textfield().text(current_d+"."+formatemonth+"."+formateyear, 11,
                                FontWeight.w500, color.datecolor,60),
                        Textfield().text(data[index]['score'], 17,
                                FontWeight.w600, color.scorecolor,40),
                        Container(
                            width: 27,
                            height: 27,

                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Popup(time:data[index]['timer'], leuge_name:data[index]['league']['name'], game_name: Gamename,);
                                    });
                              },
                              child: Card(
                                  color: color.eventbellcolor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Icon(
                                    Icons.notifications,
                                    color: color.whitecolor,
                                    size: 14,
                                  )),
                            ),
                          ),

                      ],
                    ),
                  ),
                  Container(
                    width: 230,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          child:CachedNetworkImage(
                            imageUrl:url.teamimgurl+"soccer/"+data[index]['home']['id']+".png",
                            width:40,
                            height: 40,
                            errorWidget:(context, url, error) => Image.asset("assets/images/nullimg.png") ,
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:15,left:20),
                          child:Textfield().text(data[index]['timer'].toString(), 16, FontWeight.w600,color.blackcolor,50)
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 7, right: 10),
                            child: CachedNetworkImage(
                              imageUrl:url.teamimgurl+"soccer/"+data[index]['away']['id']+".png",
                              width: 40,
                              height: 40,
                              errorWidget:(context, url, error) => Image.asset("assets/images/nullimg.png") ,
                        )),
                      ],
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(top:12,left:27,right:27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textfield().text(data[index]['home']['name'].toString(), 14, FontWeight.w500,color.teambackcolor,130),
                          Textfield().text(data[index]['away']['name'].toString(), 14, FontWeight.w500,color.teambackcolor,130),
                        ],
                      ),
                    ),
                  ],
                )

            
              ),
        )));
    return columnContent;
  }
}

leagetitle(data, index, context) {
  var size = MediaQuery.of(context).size;

  return Container(
    child: Row(
      children: [

        SizedBox(
          width: 5,
        ),
        Textfield().text(data[index]['league']['name'].toString(),12,
            FontWeight.w700, color.teambackcolor,240)
      ],
    ),
  );

}
