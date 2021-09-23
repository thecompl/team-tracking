import 'package:dio/dio.dart';

var dio = new Dio();
class Api{
  apicall(apiname) async {
    try{
      var response = await dio.get(apiname);
      var data = response.data;
      if(response.statusCode == 200){
        return data;
      }
      return null;
    }catch(err) {
      print("error="+err.toString());
      return null;
    }

  }
}


