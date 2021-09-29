import 'package:flutter/cupertino.dart';

class TeamStore{

  final int id;
  final int teamid;
  final String gamename;
  final bool fav;
  static final Columns =  ["id","teamid","gamename","fav"];
  TeamStore(this.id,this.teamid,this.gamename,this.fav);
  factory TeamStore.fromMap(Map<String, dynamic> data) {
    return   TeamStore(

      data['id'],
      data['teamid'],
      data['gamename'],
      data['fav'],

    );
  }
  Map<String, dynamic> toMap() => {
    "id": id,
    "name": teamid,
    "description": gamename,
    "price": fav,

  };

}