import 'dart:async';

import 'package:team_tracking/widget/ImageList.dart';
class Bloc{
  String game='soccer';
  final gameStateConntroller = StreamController<String>();

  StreamSink<String> get gamedata => gameStateConntroller.sink;
  Stream<String> get  _game => gameStateConntroller.stream;

  final gameeventController = StreamController<ImageList>();
  Sink<ImageList> get gameEventSink => gameeventController.sink;

  Bloc(){
    gameeventController.stream.listen(eventcontrol);
  }
  void eventcontrol(ImageList event){
      print("evente"+event.toString());
  }

}