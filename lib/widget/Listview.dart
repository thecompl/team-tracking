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
        DataList(
          'MI',
          <DataList>[
            DataList('Redmi Note 9'),
            DataList('Redmi Note 10'),
            DataList('Mi 10i 5G'),
          ],
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
        DataList('Home Appliances',),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.8,
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
      title: Text(
        root.title,
      ),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(popup);
  }
}
