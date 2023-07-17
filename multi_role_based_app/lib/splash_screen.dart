import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multi_role_based_app/home_screen.dart';
import 'package:multi_role_based_app/signup_screen.dart';
import 'package:multi_role_based_app/student_screen.dart';
import 'package:multi_role_based_app/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userLogin();
  }
  void userLogin()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    bool isUserLogin=sp.getBool('isConnected') ?? false;
    String whatsUserType=sp.getString('userType') ?? '';
    if(isUserLogin==true){
      if(whatsUserType=='Student'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => StudentScreen()));
        });
      }
      else if(whatsUserType=='Teacher'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherScreen()));
        });
      }
      else{
        Timer(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      }
    }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Image(
            height: double.infinity,
            fit: BoxFit.fitHeight,
            image: AssetImage('assets/portal.jpg'),
          ),
        ),
    );
  }
}


