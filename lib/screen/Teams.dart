import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_tracking/Api/Api.dart';
import 'package:team_tracking/Api/Url.dart';
import 'package:team_tracking/config/Database.dart';
import 'package:team_tracking/config/String.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/screen/Teamevent.dart';
import 'package:team_tracking/widget/ImageList.dart';
import 'package:team_tracking/widget/Textfield.dart';
import 'package:team_tracking/widget/loading.dart';
class Teams extends StatefulWidget {
  const Teams({Key? key}) : super(key: key);

  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  String finalmonth = '';
  List apidata = [];
  String Gamename='soccer';
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
      "gamename":"football",
      "activeimage": "assets/images/s32.png",
      "unactiveimage": "assets/images/sd32.png",
      "status": "0"
    },
    {
      "id": "5",
      "gamename":"fav",
      "activeimage": "assets/images/s33.png",
      "unactiveimage": "assets/images/s39.png",
      "status": "0"
    },
  ];
  void initState() {

    super.initState();
    fetchdata();
    var date = new DateTime.now();
    var formatemonth = DateFormat.M().format(date);
    finalmonth = formatemonth.toString();
  }
  // apicall() async {
  //   setState(() {
  //     apidata = [];
  //   });
  //
  //   await Api()
  //       .apicall(
  //       url.baseurl+"&task=$GameTask&sport=$Gamename&day=$GameDate")
  //       .then((value) {
  //     if(GameTask=='predata'){
  //
  //       if (value['games_pre'].length > 0) {
  //         setState(() {
  //           apidata = value['games_pre'];
  //
  //         });
  //       } else {
  //         setState(() {
  //           apidata = [];
  //         });
  //       }
  //     }else{
  //       if (value['games_live'].length > 0) {
  //         setState(() {
  //           apidata = value['games_live'];
  //         });
  //       } else {
  //         setState(() {
  //           apidata = [];
  //         });
  //       }
  //     }
  //
  //
  //   });
  // }


  final dbHelper = DatabaseHelper.instance;
  List dataget=[];
  Future<void> fetchdata() async {
    dataget = await dbHelper.queryAllRowswhere(Gamename);
    setState(() {
      apidata=dataget;
    });

  }
  Future<void> fevdata() async {

    dataget = await dbHelper.queryAllRowswherefav();
    print(dataget);
    setState(() {
      apidata=dataget;
    });

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  itemCount: apidata.length>0 ? apidata.length : 10,
                  itemBuilder: (BuildContext ctx, index) {
                    if(apidata.isEmpty )  return Loadingovel();
                    return gridview(index);
                  }),
            ),
          ),
        ),
      ]),
    );
  }
  ImageList(){

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

            Gamename=this.data[index]['gamename'].toString();

           if(this.data[index]['id']=="5"){
             print("hii its fav");
             fevdata();
           }
           else{
            fetchdata();
            }

          });
          // print("game name="+this.data[index]['gamename'].toString());
          // Listview(game:this.data[index]['gamename']);
          print("gamename="+this.data[index]['gamename'].toString());

        },
        child: Image(
            image: data['status'] == '0'
                ? AssetImage(this.data[index]['activeimage'].toString())
                : AssetImage(this.data[index]['unactiveimage'].toString())));
  }

  update(fav,id,index){
    print("here="+id.toString());
    var sendfav;
    fav==0?sendfav=1:sendfav=0;

    final dbHelper = DatabaseHelper.instance;
    dbHelper.update(sendfav, id);
    if(Gamename!='fav'){
      fetchdata();
    }
    else{
      fevdata();
    }

  }
  
  gridview(index){
    var size = MediaQuery.of(context).size;
    return  GestureDetector(
      onTap: () {
        int teamid=0;
        var gamename;
        var teamname=" ";
        setState(() {
          teamname = apidata[index]['teamname'].toString();
          print("teamname"+teamname);
          teamid = int.parse(apidata[index]['teamid'].toString()) ;
          gamename = Gamename;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Teamevent(team_id:teamid,game_name:gamename,team_name:teamname,cc:apidata[index]['countryname'],fav:apidata[index]['fav'])),
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
              width: size.width*0.05,
              height: size.height*0.026,
              child: GestureDetector(
                  onTap: (){
                    setState(() {
                      update(apidata[index]['fav'],apidata[index]['id'],index);
                    });
                  },

                  child: apidata[index]['fav'] == 0 ?
                  Icon(
                    Icons.star,
                    size:18,
                    color: color.cardcolor,
                  ):

                  Icon(
                    Icons.star,
                    size:18,
                    color:color.yellowcolor,
                  )
              )
          ),
          Stack(
            children: [
              ClipOval(
                child: Container(
                  height:size.height*0.09,
                  width: size.width*0.18,
                  color: color.cardcolor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 12, top: 11, left: 10, right: 10),
                child: CachedNetworkImage(
                  imageUrl: url.teamimgurl+apidata[index]["gamename"].toString()+"/"+apidata[index]["teamid"].toString()+".png",
                  width: size.width*0.13,
                  height: size.height*0.056,
                  errorWidget:(context, url, error) => Image.asset("assets/images/nullimg.png") ,
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
