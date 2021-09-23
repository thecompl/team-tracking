import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_tracking/config/String.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/screen/Teamevent.dart';
import 'package:team_tracking/widget/ImageList.dart';
import 'package:team_tracking/widget/Textfield.dart';



class Teams extends StatefulWidget {
  const Teams({Key? key}) : super(key: key);

  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  String finalmonth = '';
  final List<Map> myProducts = [
    {"id": "1", "image": "assets/images/teamlogo.png"},
    {"id": "1", "image": "assets/images/teamlogo.png"},
    {"id": "1", "image": "assets/images/teamlogo.png"},
    {"id": "1", "image": "assets/images/teamlogo.png"},
    {"id": "1", "image": "assets/images/teamlogo.png"},
    {"id": "1", "image": "assets/images/teamlogo.png"},
    {"id": "1", "image": "assets/images/teamlogo.png"},
  ].toList();
  void initState() {
    super.initState();

    var date = new DateTime.now();

    var formatemonth = DateFormat.M().format(date);

    finalmonth = formatemonth.toString();
    print(finalmonth);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        Container(
          height: size.height * 0.128,
          color: color.blackcolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child:Textfield().text("All Team", 16, FontWeight.w600, color.whitecolor,80)
              ),
              ImageList()
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35, left: 31, right: 30),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 1,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: myProducts.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom:9),
                        //   child: Icon(Icons.star),
                        // ),
                        GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Teamevent()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.all(5),
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: color.blackcolor)
                        // ),
                        child: Column(children: [
                          Container(
                              padding: EdgeInsets.only(bottom: 5),
                              width: 20,
                              height: 19,
                              child: GestureDetector(
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/starimage.png")))),
                          Stack(
                            children: [
                              ClipOval(
                                child: Container(
                                  height: 63,
                                  width: 63,
                                  color: color.cardcolor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 12, top: 11, left: 10, right: 10),
                                child: Image.asset(
                                  myProducts[index]["image"],
                                  width: 43,
                                  height: 40,
                                ),
                              )
                            ],
                          ),
                        ]),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ]),
    );
  }
}
