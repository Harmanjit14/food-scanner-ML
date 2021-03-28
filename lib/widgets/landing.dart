import 'package:FlutterMobilenet/widgets/auth.dart';
import 'package:FlutterMobilenet/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: ShadowBoldText(
                text: "FunFit",
                color: Colors.black,
                size: 50,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: RegularText(
                text: "Switch to funfit, \nNow health's a fun.",
                color: Colors.black,
                size: 30,
              ),
            ),
            SizedBox(height: 15),
            Divider(),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BoldText(text: "Name : ${profile.name}", size: 20),
                  BoldText(text: "Age : ${profile.age}", size: 20),
                  BoldText(text: "Weight : ${profile.weight}", size: 20),
                  BoldText(text: "Height : ${profile.height}", size: 20),
                  BoldText(text: "Score : ${profile.score}", size: 20),
                  BoldText(text: "Lifves left : ${profile.life}", size: 20)
                ],
              ),
            ),
            Container(
                height: 60,
                margin: EdgeInsets.fromLTRB(25, 20, 25, 10),
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>Home());
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.food_bank,size: 32,),
                        SizedBox(width: 10),
                        BoldText(text: "Add Meal",size: 24,),
                      ],
                    )))
          ],
        ),
      )),
    );
  }
}
