
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/view/screen/auth/sign_in/sign_in.dart';
import 'package:getx_state_management/view/screen/home/home.dart';


void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
