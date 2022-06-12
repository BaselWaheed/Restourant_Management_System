import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/layout/categories_layout/kale_me_crazy/kalr_me_crazy.dart';
import 'package:untitled1/shared/components/component.dart';


class StartScreen extends StatefulWidget {

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  //دي ميثود عشان بخلي الاسكرينه تاخد وقت معين وتنقل علي الاسكرينه الي بعدها (الاون بوردينج)
  void initState() {
    super.initState();
    Timer(Duration(seconds:7),
            () =>
            navegateAndReplacement(context, KaleMeCrazy())
    );
  }

  @override
  Widget build(BuildContext context) {
    //الديزاين
    return Scaffold(
      backgroundColor: HexColor('#e3342f'),
      body:Center(child: Lottie.asset('assets/images/start.json',fit: BoxFit.cover,  ))
    );
  }
}
