// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:multi_role_based_app/home_screen.dart';
import 'package:multi_role_based_app/student_screen.dart';
import 'package:multi_role_based_app/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController idController=TextEditingController();
  @override
  void initState(){
    super.initState();
    nameController.addListener(() => setState(() {}));
    emailController.addListener(() => setState(() {}));
    idController.addListener(() => setState(() {}));
  }
  final items=['Student', 'Teacher', 'Admin'];
  String? valueChoose;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('SignUp Screen',
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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 0.sp, bottom: 0.sp),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.sp),
                          borderSide: BorderSide(color: Colors.black, width:2.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.sp),
                          borderSide: BorderSide(color: Colors.black, width:2.w),
                        ),
                        hintText: 'Name',
                        hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.sp),
                      ),
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h,),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 0.sp, bottom: 0.sp),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.sp),
                          borderSide: BorderSide(color: Colors.black, width:2.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.sp),
                          borderSide: BorderSide(color: Colors.black, width:2.w),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp),
                      ),
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h,),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 0.sp, bottom: 0.sp),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.sp),
                          borderSide: BorderSide(color: Colors.black, width:2.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.sp),
                          borderSide: BorderSide(color: Colors.black, width:2.w),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.sp),
                      ),
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h,),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: TextFormField(
                      controller: idController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 0.sp, bottom: 0.sp),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.sp),
                          borderSide: BorderSide(color: Colors.black, width:2.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.sp),
                          borderSide: BorderSide(color: Colors.black, width:2.w),
                        ),
                        hintText: 'User ID',
                        hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.sp),
                      ),
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Container(
                    margin: EdgeInsets.all(16.sp),
                    padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 0.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.sp),
                      border: Border.all(color: Colors.black, width:2.w),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text('Select your UserType', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp),),
                        dropdownColor: Colors.white,
                        value: valueChoose,
                        iconSize: 36.sp,
                        icon: Icon(Icons.arrow_drop_down_rounded, color: Colors.black,),
                        isExpanded: true,
                        items: items.map((valueItem){
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp),),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() => valueChoose = newValue);
                        }
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                      ),
                      onPressed: ()async{
                        SharedPreferences sp=await SharedPreferences.getInstance();
                        sp.setString('name', nameController.text.toString());
                        sp.setString('email', emailController.text.toString());
                        sp.setString('id', idController.text.toString());
                        sp.setString('userType', valueChoose.toString());
                        sp.setBool('isConnected', true);
                        if(sp.getString('userType')=='Student'){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => StudentScreen()));
                        }
                        else if(sp.getString('userType')=='Teacher'){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherScreen()));
                        }
                        else{
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Text("Sign Up",
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
        ),
      ),
    );
  }
}
