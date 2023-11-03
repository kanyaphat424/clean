// import 'package:clean/loginscreen.dart';
import 'package:clean/loginscreen.dart';
import 'package:clean/onboarding.dart';
import 'package:clean/profilepage.dart';
import 'package:clean/settingpage.dart';
import 'package:clean/sidemenu.dart';
import 'package:clean/signupscreen.dart';
// import 'package:clean/signupscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CARECLEAN',
      theme: ThemeData(

      ),
      home:onboarding()
    );
  }
}