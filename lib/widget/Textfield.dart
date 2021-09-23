import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textfield {
  text(title,double no,wieght,color,double width) {
    return
      Container(

        width: width,
        child: Expanded(
          child: Text(title.toString(),
            style: TextStyle(fontFamily: "Gilroy",
                fontSize: no,
                fontWeight: wieght,
                color: color),),
        ),
      );
  }
}