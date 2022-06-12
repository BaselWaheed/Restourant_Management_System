import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled1/resturant_app/onboarding_screen/onboarding_screens.dart';
import 'package:untitled1/shared/components/component.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  //دي ميثود عشان بخلي الاسكرينه تاخد وقت معين وتنقل علي الاسكرينه الي بعدها (الاون بوردينج)
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>navegateTo(context, OnBoardingScreen()));
  }
  @override
  Widget build(BuildContext context) {
    //الديزاين
    return Scaffold(
      body: Image(
        image: AssetImage('assets/images/back.jpeg'),
        width: double.infinity,
        height:double.infinity ,
        fit: BoxFit.cover,
      ),
    );
  }
}
