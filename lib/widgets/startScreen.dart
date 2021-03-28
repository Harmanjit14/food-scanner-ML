import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  final camera;

  const LandingScreen({Key key, this.camera}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                "FunFit",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
