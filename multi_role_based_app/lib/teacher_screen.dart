// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:multi_role_based_app/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  String name='', email='', id='',type='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSpecificData();
  }
  void loadSpecificData()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    name=sp.getString('name') ?? '';
    email=sp.getString('email') ?? '';
    id=sp.getString('id') ?? '';
    type=sp.getString('userType') ?? '';
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Teacher Screen',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),),
          automaticallyImplyLeading: false,
          elevation: 0.sp,
          centerTitle: true,
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.sp),),
                  Text(name.toString(), style: TextStyle(fontWeight: FontWeight.normal,fontSize: 13.sp),),
                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.sp),),
                  Text(email.toString(), style: TextStyle(fontWeight: FontWeight.normal,fontSize: 13.sp),),
                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('User ID', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.sp),),
                  Text(id.toString(), style: TextStyle(fontWeight: FontWeight.normal,fontSize: 13.sp),),
                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('User Type', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.sp),),
                  Text(type.toString(), style: TextStyle(fontWeight: FontWeight.normal,fontSize: 13.sp),),
                ],
              ),
              SizedBox(height: 70.h,),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                  ),
                  onPressed: () async{
                    SharedPreferences sp=await SharedPreferences.getInstance();
                    sp.clear();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Text("Sign Out",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
