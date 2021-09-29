import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:team_tracking/config/color.dart';
class Loadingcard extends StatefulWidget {


  @override
  _LoadingcardState createState() => _LoadingcardState();
}
class _LoadingcardState extends State<Loadingcard> {
  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
        child: Container(
            margin: EdgeInsets.only(left:5, right:5, top: 2, bottom: 2),
            height: MediaQuery.of(context).size.height*0.09,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)
            )
        )
    );
  }

}

class Loadingovel extends StatefulWidget {


  @override
  _LoadingovelState createState() => _LoadingovelState();
}
class _LoadingovelState extends State<Loadingovel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:15),
      child: SkeletonAnimation(
          child: Column(
              children: [
                Icon(
                  Icons.star,
                  size:18,
                  color: color.cardcolor,
                ),
                Container(
                  width:70,
                  height: 70,
                  child: Card(
                    color: color.cardcolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ],

          )
      ),
    );
  }

}