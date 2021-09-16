import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        DataList('MI',),
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
        DataList('Home Appliances',),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height*0.7,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              Card(child: DataPopUp(data[index])),
          itemCount: data.length,),
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
class DataPopUp extends StatelessWidget {
  const DataPopUp(this.popup);
  final DataList popup;

  Widget _buildTiles(DataList root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<DataList>(root),
      title: Row(
          children:[
          Container(
            width:50,
              height: 50,
              child: Image(image: AssetImage("assets/images/s30.png"))
          ),
          SizedBox(width:20,),
          Text(
          root.title,
        ),
        ]
      ),
      children:
      root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(popup);
  }
}
