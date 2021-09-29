import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiver/time.dart';
import 'package:team_tracking/Api/Api.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/widget/MonthYear.dart';
import 'package:intl/intl.dart';
import 'package:team_tracking/Api/Url.dart';
import 'package:team_tracking/widget/Popup.dart';
import 'package:team_tracking/widget/Textfield.dart';
import 'package:team_tracking/screen/Match.dart';
import 'package:team_tracking/widget/loading.dart';
import '../config/Database.dart';
class Event extends StatefulWidget {

  const Event({Key? key}) : super(key: key);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  String finalDate = '';
  var list = 10;
  List apidata = [];
  String Gamename='';
  String GameDate='';
  String GameTask='';
  var formatemonth = DateFormat.M().format(DateTime.now());
  var formateyear = DateFormat.y().format(DateTime.now());
  var current_d = DateFormat.d().format(DateTime.now());
  var current_date = current_d + formatemonth + formateyear;
  var data = [
    {
      "id": "0",
      "gamename":"soccer",
      "activeimage": "assets/images/s28.png",
      "unactiveimage": "assets/images/sd28.png",
      "status": "1"
    },
    {
      "id": "1",
      "gamename":"Basketball",
      "activeimage": "assets/images/s29.png",
      "unactiveimage": "assets/images/sd29.png",
      "status": "0"
    },
    {
      "id": "2",
      "gamename":"Volleyball",
      "activeimage": "assets/images/s30.png",
      "unactiveimage": "assets/images/sd30.png",
      "status": "0"
    },
    {
      "id": "3",
      "gamename":"baseball",
      "activeimage": "assets/images/s31.png",
      "unactiveimage": "assets/images/sd31.png",
      "status": "0"
    },
    {
      "id": "4",
      "gamename":"Hockey",
      "activeimage": "assets/images/s32.png",
      "unactiveimage": "assets/images/sd32.png",
      "status": "0"
    },
    {
      "id": "5",
      "activeimage": "assets/images/s33.png",
      "unactiveimage": "assets/images/s39.png",
      "status": "0"
    },
  ];

  void initState() {
    super.initState();
    setState(() {
      GameDate='today';
      GameTask='livedata';
      Gamename='soccer';
    });
    apicall();
  }
  apicall() async {
    setState(() {
      apidata = [];
    });

    await Api()
        .apicall(
          url.baseurl+"&task=$GameTask&sport=$Gamename&day=$GameDate")
        .then((value) {
          if(GameTask=='predata'){
            if (value['games_pre'].length > 0) {
              setState(() {
                apidata = value['games_pre'];
              });
            } else {
              setState(() {
                apidata = [];
              });
            }
          }else{
            if (value['games_live'].length > 0) {
              setState(() {
                apidata = value['games_live'];
              });
            } else {
              setState(() {
                apidata = [];
              });
            }
          }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
            children: [
              Header(),
              Listview()
            ],
          ),
      ),
    );
  }

  Header() {
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
        width: size.width * 1,
        height: size.height * 0.200,
        color: color.blackcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MonthYear(),
            DateScroll(),
            Padding(
              padding: const EdgeInsets.only(left:10,right:10),
              child: Divider(color: color.whitecolor, thickness: 2,),
            ),
            ImageList()
          ],
        )
    );
  }

  Listview() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.675,
        child: ListView.builder(
            itemCount: apidata.length>0 ? apidata.length : 10,
            itemBuilder: (BuildContext context, int i) {
              if(apidata.isEmpty) return Loadingcard();
              return new ExpansionTile(
                  title: leagetitle(apidata, i, context),
                  children: _buildExpandableContent(i));
            }),
      ),
    );

  }


  _buildExpandableContent(index) {

    _insert(apidata[index]['home']['id'].toString(),apidata[index]['home']['name'].toString(),apidata[index]['league']['cc']);
    _insert(apidata[index]['away']['id'].toString(),apidata[index]['away']['name'].toString(),apidata[index]['league']['cc']);


    print("image="+url.teamimgurl+Gamename+"/"+apidata[index]['away']['id']+".png");
    var size = MediaQuery.of(context).size;
    List<Widget> columnContent = [];
    columnContent.add(Container(
        height:size.height*0.230,
        width:size.width*0.95,
        child: GestureDetector(

          onTap: () {
           int gameid=0;
           var datasend=[];
           var send=[];
           setState(() {

              datasend.add(Gamename.toString());
              datasend.add(apidata[index]['league']['name'].toString());
              datasend.add(apidata[index]['home']['id'].toString());
              datasend.add(apidata[index]['home']['name'].toString());
              datasend.add(apidata[index]['away']['id'].toString());
              datasend.add(apidata[index]['away']['name'].toString());
              datasend.add(apidata[index]['timer'].toString());
             GameTask=='predata'?
             datasend.add(apidata[index]['date_games'].toString())
                 :
             datasend.add(current_d+"."+formatemonth+"."+formateyear);

              gameid  = int.parse(apidata[index]['game_id']);

            });

           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Match(game_id:gameid,list:datasend)),
            );
          },
          child: Card(
              color: color.tmpcardcolor,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 23,top:15,right: 23),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GameTask=='pre'?
                        Textfield().text(apidata[index]['date_games'].toString(), 11,
                        FontWeight.w500, color.datecolor,60)
                      :
                        Textfield().text(current_d+"."+formatemonth+"."+formateyear, 11,
                            FontWeight.w500, color.datecolor,60),

                        Textfield().text(apidata[index]['score'], 17,
                            FontWeight.w600, color.scorecolor,40),
                        Container(
                          margin: EdgeInsets.only(bottom:5),
                          width:size.width*0.1,
                          height: size.height*0.05,
                          child: GestureDetector(
                            onTap: () {

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Popup(game_id:apidata[index]['game_id'],leuge_name:apidata[index]['league']['name'].toString(),game_name:Gamename,time:apidata[index]['timer'],team_name1:apidata[index]['home']['name'],team_name2:apidata[index]['away']['name'],);
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
                                  size: 17,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width:size.width*0.65,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          child:CachedNetworkImage(
                            imageUrl:url.teamimgurl+Gamename+"/"+apidata[index]['home']['id']+".png",
                            width:size.width*0.2,
                            height:size.width*0.1,
                            errorWidget:(context, url, error) => Image.asset("assets/images/nullimg.png") ,
                          ),

                        ),
                        Padding(
                            padding: const EdgeInsets.only(top:15,left:18),
                            child:Textfield().text(apidata[index]['timer'].toString(), 16, FontWeight.w600,color.blackcolor,50)
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 7, right: 10),
                            child: CachedNetworkImage(
                              imageUrl:url.teamimgurl+Gamename+"/"+apidata[index]['away']['id']+".png",
                              width:size.width*0.2,
                              height:size.width*0.1,
                              errorWidget:(context, url, error) => Image.asset("assets/images/nullimg.png") ,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top:12,left:28,right:15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Textfield().text(apidata[index]['home']['name'].toString(), 14, FontWeight.w500,color.teambackcolor,130),
                        Textfield().text(apidata[index]['away']['name'].toString(), 14, FontWeight.w500,color.teambackcolor,130),
                      ],
                    ),
                  ),
                ],
              )


          ),
        )));
    return columnContent;
  }
  leagetitle(data, index, context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: [
          SvgPicture.network(
              url.imgurl+data[index]['league']['cc']+".svg",
              width:size.width*0.05,
              height:size.height*0.05,
              placeholderBuilder: (BuildContext context) =>
                  Container(width:size.width*0.11,
                      child: Image.asset("assets/images/nullimg.png"))

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

  ImageList() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.056,
      child: new ListView.builder(
          padding: EdgeInsets.all(0.1),
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (BuildContext ctxt, int index) {

            return Padding(
              padding: const EdgeInsets.only(left: 5),
              child: gamecategory(data[index], index),
            );
          }),
    );

  }

  Widget gamecategory(data, index) {

    return GestureDetector(
        onTap: () {
          setState(() {
            var gcvalue = this.data[index]['status'];
            if (gcvalue == "1") {
              this.data[index]['status'] = '0';
            } else {
              for (int i = 0; i < this.data.length; i++) {
                this.data[i]['status'] = '0';
              }
              this.data[index]['status'] = '1';
            }
          });
          // print("game name="+this.data[index]['gamename'].toString());
          // Listview(game:this.data[index]['gamename']);
          print("gamename="+this.data[index]['gamename'].toString());
          setState(() {
            Gamename=this.data[index]['gamename'].toString();
          });
          apicall();
        },
        child: Image(
            image: data['status'] == '0'
                ? AssetImage(this.data[index]['activeimage'].toString())
                : AssetImage(this.data[index]['unactiveimage'].toString())));
  }

  DateScroll() {
    int itemsize = 130;
    var size = MediaQuery.of(context).size;
    var formatemonth = DateFormat.M().format(DateTime.now());
    var formateyear = DateFormat.y().format(DateTime.now());
    var current_d = DateFormat.d().format(DateTime.now());
    var dayinmonth = daysInMonth(int.parse(formateyear.toString()), int.parse(formatemonth.toString()));
    final _controller = ScrollController();


    _moveright() {
      _controller.animateTo(_controller.offset - itemsize,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    }
    _moveleft() {
      _controller.animateTo(_controller.offset + itemsize,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    }

    return Container(
      padding: EdgeInsets.only(bottom:4),
      child: Row(children: [
        GestureDetector(
          onTap: () {
            _moveright();
          },
          child: Padding(
            padding: const EdgeInsets.only(left:16,bottom:8),
            child: Icon(
              Icons.arrow_back_ios,
              size: 19,
              color: color.whitecolor,
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(left: 10),
          height: size.height*0.045,
          width:size.width*0.80,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: dayinmonth,
              itemBuilder: (BuildContext context, int index) {
                var date = index + 1;
                int cdate =int.parse(current_d);

                var focus = cdate == date?true:false;


                return  Padding(
                  padding: const EdgeInsets.only(left:9),
                  child: Container(

                      width: size.width*0.1,
                      height:size.height*0.1 ,
                      child: focus == true ?
                      Stack(
                        children: [

                          Container(
                            color: color.yellowcolor,
                            height:size.height*0.05 ,
                            width:size.width*0.09,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap:(){
                                GameTask='livedata';
                                apicall();
                              },
                              child: Container(
                                  child:Textfield().text("$date", 14, FontWeight.w500, color.blackcolor,20)

                              ),
                            ),
                          ),
                        ],
                      ):
                      Stack(
                        children: [
                          GestureDetector(
                              onTap: (){
                                setState((){
                                  GameDate=formateyear+(int.parse(formatemonth) <10?("0"+formatemonth):(formatemonth))+date.toString();
                                  GameTask='predata';
                                });
                                apicall();
                              },
                            child: Container(
                                padding: EdgeInsets.all(6),
                                child: Textfield().text("$date",12,FontWeight.w600, color.whitecolor,20)

                            ),
                          ),
                        ],
                      )
                  ),
                );

              }),
        ),
        GestureDetector(
          onTap: () {
            _moveleft();
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom:8),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 19,
              color: color.whitecolor,
            ),
          ),
        ),
      ]),
    );
  }
  final dbHelper = DatabaseHelper.instance;
  void _insert(String teamid, String teamname,contrycode) async {
    // row to insert
     Map<String, dynamic> row = {
      DatabaseHelper.teamid  : teamid,
      DatabaseHelper.gamename  : Gamename,
      DatabaseHelper.fav  : 0,
      DatabaseHelper.teamname  : teamname,
      DatabaseHelper.countryname  : contrycode,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

}
