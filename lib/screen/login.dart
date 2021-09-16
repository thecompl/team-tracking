import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_tracking/config/String.dart';
import 'package:team_tracking/config/color.dart';
import 'package:team_tracking/screen/Home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool loading=false,logstatus=false;

  // void login_user() async {
  //   var data = {
  //     'email' : username.text.toString(),
  //     'password' : password.text.toString(),
  //   };
  //   setState(() {
  //     loading=true;
  //   });
  //   print("api call");
  //   await Api().postApicall(Urls.userSignIn, data, BuildContext).then((value) {
  //     if(value==null){
  //       setState(() {
  //         loading = false;
  //         logstatus = true;
  //       });
  //     }
  //     else if(value['status'].toString()=="1"){
  //
  //       setState(() {
  //         loading = false;
  //         logstatus = false;
  //       });
  //       storeLoginData(value['data']);
  //     }
  //     else {
  //       setState(() {
  //         loading = false;
  //         logstatus = true;
  //       });
  //     }
  //   });
  // }

  void initState() {
    super.initState();
  }
  // storeLoginData(var data) async {
  //   print("firmid"+data[0]['name'].toString());
  //   SharedPreferences _preferences = await SharedPreferences.getInstance();
  //   _preferences.setString("id", data[0]['id'].toString());
  //   _preferences.setString("name", data[0]['name'].toString());
  //   _preferences.setString("email", data[0]['email'].toString());
  //   _preferences.setString("avatar", data[0]['avatar'].toString());
  //   _preferences.setString("phone", data[0]['phone'].toString());
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => Events()));
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        loading?Center( child:CupertinoActivityIndicator() ):
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ClipPath(
                  child:Container(
                    child:  Center(child: Text('Team Tracking',style: TextStyle(color:color.blackcolor,fontFamily:'Gilroy',fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: letterspacing))),

                 width: MediaQuery.of(context).size.width *1,
                    height: MediaQuery.of(context).size.height *0.45,
                    decoration:BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0XFFFFCC00),Colors.white]
                        )
                    ),


                  ),

                  clipper: MyCustomClipper(),
                ),
              ),
              Container(
                // height: MediaQuery.of(context).size.height*0.55,
                  child:Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Align(
                          alignment: Alignment(-0.85,-0.75),
                          child: Text(
                              'Login',style:TextStyle(color: Colors.blueGrey, fontSize:20,)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment:Alignment(-0.81,-0.75),
                          child: Text('Happy to see you again',style:TextStyle(color:Colors.blueGrey))
                      ),
                      SizedBox(
                        height:30,
                      ),
                      txt('Email',false,username,"please enter email"),
                      txt('Password',true,password,"please enter password"),

                      SizedBox(
                        height:10,
                      ),
                      SizedBox(
                        height:30,
                      ),
                      btn(),
                      logstatus?
                      warning():Container(),
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }

  Widget warning() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Invalid Username Or Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10,color: Color(0XFFFFCC00),letterSpacing: 0.5),
                ),

              ] ,
            ),
          ),
        ]
    );
  }
  Widget txt(title,password,key,error){
    return Container(

        width:MediaQuery.of(context).size.width * 0.85,
        child: Container(
          child: TextField(
            controller: key,
            style: TextStyle(fontSize:15,letterSpacing: 0.7,color:Colors.black),
            obscureText: password,
            decoration: InputDecoration(
              hintText:"Please enter your "+title ,
              hintStyle: TextStyle(fontSize: 15,letterSpacing:0.5,color:Colors.black),
              labelText: title,
            ),
          ),
        )
    );
  }
  Widget btn(){
    return Container(
      width:MediaQuery.of(context).size.width*0.86,
      height:50,

      child: ElevatedButton(onPressed: () {
        print('pressed');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      },
        child: Text('Login',style:TextStyle(letterSpacing: 0.7,fontSize:18,fontWeight: FontWeight.bold,color: Colors.white),),
        style: ElevatedButton.styleFrom(
          primary:Color(0XFFFFCC00),
          onPrimary: Colors.white,
        ),
      ),
    );
  }

}
class MyCustomClipper extends CustomClipper<Path>{
  var radius=10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/4, size.height
        - 40, size.width/2, size.height-20);
    path.quadraticBezierTo(3/4*size.width, size.height,
        size.width, size.height-30);
    path.lineTo(size.width, 0);
    return path;

  }

  @override
  bool shouldReclip( CustomClipper<Path> oldClipper) =>
      false;
}