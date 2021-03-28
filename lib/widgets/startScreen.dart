import 'package:FlutterMobilenet/widgets/login.dart';
import 'package:FlutterMobilenet/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final camera;

  const Login({Key key, this.camera}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: size.height * 0.45,
            child: Image.asset(
              "assets/video.gif",
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ShadowBoldText(
                    text: "FunFit",
                    size: 60,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  alignment: Alignment.center,
                  child: RegularText(
                    text:
                        "Fed up of all the boring health apps which are no where helping you to maintain a healthy diet plan?",
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue[700]),
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => Registerscreen(),
                            transition: Transition.native);
                      },
                      child: BoldText(
                        text: "SignUp",
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => LoginSreen(),
                            transition: Transition.native);
                      },
                      child: BoldText(
                        text: "SignIn",
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
