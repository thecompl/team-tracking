import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:team_tracking/Api/Api.dart';
import 'package:team_tracking/Api/Url.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/screen/Match.dart';
import 'package:team_tracking/screen/Teamevent.dart';
import 'package:team_tracking/widget/Popup.dart';
import 'package:team_tracking/widget/Textfield.dart';

class DataList {
  DataList(this.title, [this.children = const <DataList>[]]);
  final String title;
  final List<DataList> children;
}

class Listview extends StatefulWidget {
  const Listview({Key? key}) : super(key: key);

  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  List data = [];
  void initState() {

    super.initState();
    apicall();
  }

  apicall() async {
    await Api()
        .apicall(
            "https://spoyer.ru/api/get.php?login=ayna&token=12784-OhJLY5mb3BSOx0O&task=livedata&sport=soccer")
        .then((value) {
      if (value['games_live'].length > 0) {
        setState(() {
          data = value['games_live'];
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
            itemCount: data.length,
            itemBuilder: (BuildContext context, int i) {
              return new ExpansionTile(
                  title: leagetitle(data, i, context),
                  children: _buildExpandableContent(i));
            }),
      ),
    );
  }

  _buildExpandableContent(index) {
    print("imageteam=="+data[index]['home']['id'].toString());
    var size = MediaQuery.of(context).size;
    List<Widget> columnContent = [];
    columnContent.add(Container(
        height:size.height*0.230,
        width:size.width*360,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Match()),
            );
          },
          child: Card(
              color: color.tmpcardcolor,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 23,top: 23,right: 23),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Textfield().text("23.08.2021", 11,
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
                                      return Popup();
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
                            width:50,
                            height: 50,
                            placeholder: (context, url) => Text("No image"),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:15,left:20),
                          child:Textfield().text(data[index]['timer'].toString(), 16, FontWeight.w600,color.blackcolor,40)
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 7, right: 10),
                            child: CachedNetworkImage(
                              width: 50,
                              height: 50,
                             imageUrl:url.teamimgurl+"soccer/"+data[index]['away']['id']+".png",)
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(top:12,left:27,right:27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textfield().text(data[index]['home']['name'].toString(), 14, FontWeight.w500,color.teambackcolor,120),
                          Textfield().text(data[index]['away']['name'].toString(), 14, FontWeight.w500,color.teambackcolor,120),
                        ],
                      ),
                    ),
                  ],
                )

              // ListTile(title: Text(root.title))),
              ),
        )));
    return columnContent;
  }
}

leagetitle(data, index, context) {

  return Container(
    child: Row(
      children: [
        SvgPicture.network(
          url.imgurl+data[index]['league']['cc']+".svg",
          width: 37,
          height:37,
          semanticsLabel: 'A shark?!',
          // placeholderBuilder: (BuildContext context) => Container(
          //     child: const CircularProgressIndicator()),
        ),
        SizedBox(
          width: 5,
        ),
        Textfield().text(data[index]['league']['name'].toString(),12,
            FontWeight.w700, color.teambackcolor,240)
      ],
    ),
  );

}
