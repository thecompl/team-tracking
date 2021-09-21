import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/screen/Match.dart';
import 'package:team_tracking/screen/Teamevent.dart';

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
  final List<DataList> data = <DataList>[
    DataList(
      'Mobiles',
      <DataList>[
        DataList(
          'MI',
        ),
        DataList('Samsung'),
        DataList('Apple'),
      ],
    ),
    DataList(
      'Laptops',
      <DataList>[
        DataList('Dell'),
        DataList('HP'),
      ],
    ),
    DataList(
      'Appliances',
      <DataList>[
        DataList('Washing Machine'),
        DataList('AC'),
        DataList(
          'Home Appliances',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.7,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              Card(child: DataPopUp(data[index])),
          itemCount: data.length,
        ),
        // child: ListView(
        //   children: const <Widget>[
        // Card(
        // child: ListTile(
        // leading: FlutterLogo(),
        // title: Text('One-line with both widgets'),
        // trailing: Icon(Icons.arrow_forward_ios),
        // ),),
        //     Card(
        //       child: ListTile(
        //
        //         leading: FlutterLogo(),
        //         title: Text('One-line with both widgets'),
        //         trailing: Icon(Icons.arrow_forward_ios),
        //       ),),
        //     Card(
        //       child: ListTile(
        //         leading: FlutterLogo(),
        //         title: Text('One-line with both widgets'),
        //         trailing: Icon(Icons.arrow_forward_ios),
        //       ),),
        //     Card(
        //       child: ListTile(
        //         leading: FlutterLogo(),
        //         title: Text('One-line with both widgets'),
        //         trailing: Icon(Icons.arrow_forward_ios),
        //       ),),
        //     Card(
        //       child: ListTile(
        //         leading: FlutterLogo(),
        //         title: Text('One-line with both widgets'),
        //         trailing: Icon(Icons.arrow_forward_ios),
        //       ),),
        //     Card(
        //       child: ListTile(
        //         leading: FlutterLogo(),
        //         title: Text('One-line with both widgets'),
        //         trailing: Icon(Icons.arrow_forward_ios),
        //       ),),
        //     Card(
        //       child: ListTile(
        //         leading: FlutterLogo(),
        //         title: Text('One-line with both widgets'),
        //         trailing: Icon(Icons.arrow_forward_ios),
        //       ),)
        //   ],
        // ),
      ),
    );
  }
}

class DataPopUp extends StatefulWidget {
  final DataList popup;
  const DataPopUp(this.popup);

  @override
  _DataPopUpState createState() => _DataPopUpState();
}

class RadioList {
  String name;
  int index;
  RadioList({required this.name, required this.index});
}

class _DataPopUpState extends State<DataPopUp> {
  int id = -1;
  @override
  Widget build(BuildContext context) {
    return _buildTiles(widget.popup);
  }

  Widget _buildTiles(DataList root) {
    List<RadioList> RList = [
      RadioList(
        index: 1,
        name: "Half an hour before the event",
      ),
      RadioList(
        index: 2,
        name: "1 hours before the event",
      ),
      RadioList(
        index: 3,
        name: "2 hours before the event",
      ),
      RadioList(
        index: 4,
        name: "3 hours before the event",
      ),
      RadioList(index: 5, name: "4 hours before the event")
    ];

    if (root.children.isEmpty)
      return Container(
          height: 154,
          width: 360,
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text("23.08.2021",
                              style: TextStyle(
                                  fontFamily: "Gilroy",
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: color.datecolor)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10),
                          child: Container(
                            width: 35,
                            height: 35,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      int id = 0;
                                      return AlertDialog(
                                        title: Text("Notify me.....",
                                            style: TextStyle(
                                              fontFamily: "Gilroy",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Cancel',
                                                style: TextStyle(
                                                  color: color.popupbtncolor,
                                                  fontFamily: "Gilroy",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text('Notify me',
                                                style: TextStyle(
                                                    color: color.popupbtncolor,
                                                    fontFamily: "Gilroy",
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                        content: StatefulBuilder(
                                          builder: (BuildContext context,
                                              StateSetter setState) {
                                            return Container(
                                              height: 360,
                                              child: Column(
                                                children: RList.map((data) =>
                                                    RadioListTile(
                                                      title: Text(
                                                          "${data.name}",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Gilroy",
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )),
                                                      groupValue: id,
                                                      value: data.index,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          id = data.index;
                                                        });
                                                      },
                                                    )).toList(),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    });
                              },
                              child: Card(
                                  color: color.eventbellcolor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Icon(Icons.notifications,color: color.whitecolor,size:18         ,)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 230,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7, left: 10),
                            child: Image.asset("assets/images/teamicon1.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text("17:00",
                                style: TextStyle(
                                    fontFamily: "Gilroy",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 7, right: 10),
                              child: Image.asset("assets/images/teamicon2.png"))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:10,left:72),
                          child: Text("Team1",
                              style: TextStyle(
                                  fontFamily: "Gilroy",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10,left:125),
                          child: Text(
                            "Team2",
                            style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )
                  ],
                )

                // ListTile(title: Text(root.title))),
                ),
          ));
    return ExpansionTile(
      key: PageStorageKey<DataList>(root),
      title: Row(children: [
        Container(
            height: 30,
            width: 30,
            child: Image.asset("assets/images/flag.png")),
        SizedBox(
          width: 20,
        ),
        Text(
          root.title,
        ),
      ]),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  Widget _myRadioButton({title, value, onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: id,
      onChanged: onChanged,
      title: Text(title),
    );
  }
}
// class DataPopUp extends StatelessWidget {
//   const DataPopUp(this.popup);
//   final DataList popup;
//
//
//   Widget _buildTiles(DataList root){
//     if (root.children.isEmpty) return Container(
//       height: 154,
//       width: 360,
//       child: GestureDetector(
//         onTap: (){
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Teams()),
//           );
//         },
//         child: Card(
//              color: color.cardcolor,
//             child:Column(children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10,left: 10),
//                     child: Text("23.08.2021",style: TextStyle(fontFamily: "Gilroy",fontSize: 11,fontWeight: FontWeight.w500,color: color.datecolor)),
//                   ),
//
//                   Padding(
//                     padding: const EdgeInsets.only(top:10,right: 10),
//                     child: Container(
//                       width:35,
//                       height: 35,
//                       child: GestureDetector(
//                         onTap: (){
//                           print("asjjsa");
//                           showDialog(context: context, builder: (BuildContext context){
//                             return AlertDialog(
//
//                             );
//                           });
//                         },
//                         child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             child: Icon(Icons.notifications)
//                         ),
//                       ),
//                     ),
//                   )
//                 ],),
//               Container(
//                 width: 230,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//
//                     Padding(
//                       padding: const EdgeInsets.only(top: 7,left: 10),
//                       child: Image.asset("assets/images/team1.png"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top:30),
//                       child: Text("17:00",style: TextStyle(fontFamily: "Gilroy",fontSize: 16,fontWeight: FontWeight.w600)),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top:7,right: 10),
//                       child: Image.asset("assets/images/team2.png")
//                     )
//                   ],),
//               ),
//               Row(
//                 children:[
//
//                   Padding(
//                     padding: const EdgeInsets.only(left:80),
//                     child: Text("Team1",style: TextStyle(fontFamily: "Gilroy",fontSize: 14,fontWeight: FontWeight.w500)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left:105),
//                     child: Text("Team2",style: TextStyle(fontFamily: "Gilroy",fontSize: 14,fontWeight: FontWeight.w500),),
//                   )
//                 ],
//
//               )
//             ],)
//
//             // ListTile(title: Text(root.title))),
//     ),
//       ));
//     return ExpansionTile(
//        key: PageStorageKey<DataList>(root),
//         title: Row(children:[Container( height: 30,width: 30, child:Image.asset("assets/images/flag.png")),
//           SizedBox(width:20,),
//           Text(
//           root.title,
//         ),
//         ]
//       ),
//       children:
//       root.children.map(_buildTiles).toList(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildTiles(popup);
//   }
// }
