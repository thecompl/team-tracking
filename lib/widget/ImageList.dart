import 'dart:convert';
import 'package:flutter/material.dart';
class ImageList extends StatefulWidget {
  const ImageList({Key? key}) : super(key: key);

  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  var data =[
        {
          "id": "0",
          "activeimage":"assets/images/s28.png",
          "unactiveimage":"assets/images/sd28.png",
          "status" : "0"
        },
        {
          "id": "1",
          "activeimage": "assets/images/s29.png",
          "unactiveimage": "assets/images/sd29.png",
          "status" : "0"
        },
        {
          "id": "2",
          "activeimage": "assets/images/s30.png",
          "unactiveimage": "assets/images/sd30.png",
          "status" : "0"
        },
    {
      "id": "3",
      "activeimage": "assets/images/s31.png",
      "unactiveimage": "assets/images/sd31.png",
      "status" : "0"
    },
    {
      "id": "4",
      "activeimage": "assets/images/s32.png",
      "unactiveimage": "assets/images/sd32.png",
      "status" : "0"
    },
    {
      "id": "4",
      "activeimage": "assets/images/s33.png",
      "unactiveimage": "assets/images/s39.png",
      "status" : "0"
    },




      ];


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Container(
      height:size.height*0.056,

      child: new ListView.builder(
        padding: EdgeInsets.all(0.1),
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return  gamecategory(data[index],index);
          }
      ),
    );
  }

  Widget gamecategory(data,index){
    print("gamec="+index.toString());
    var imagechange=data['activeimage'].toString();
    return
      GestureDetector(
        onTap: (){
          setState(() {
            var gcvalue=this.data[index]['status'];
            if(gcvalue=="1"){

                this.data[index]['status']='0';

            }
           else{
              for(int i=0;i<this.data.length;i++){
                this.data[i]['status']='0';
              }
              this.data[index]['status']='1';

            }
          });

        },
          child: Image(
              image:
                  data['status']=='0'?
                AssetImage(this.data[index]['activeimage'].toString()):
                AssetImage(this.data[index]['unactiveimage'].toString())

          )
      );
  }


}

