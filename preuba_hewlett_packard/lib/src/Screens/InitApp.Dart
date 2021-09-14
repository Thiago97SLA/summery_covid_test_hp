import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:preuba_hewlett_packard/src/widget/Backgrounp.Dart';
import 'package:preuba_hewlett_packard/src/widget/FontStyleText.Dart';

class ScreenInit extends StatefulWidget {
  const ScreenInit({Key key}) : super(key: key);

  @override
  _ScreenInitState createState() => _ScreenInitState();
}

class _ScreenInitState extends State<ScreenInit> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, 'home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background('assets/background/init.png'),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 200,
                    child: FontWidget(
                        text: 'Covid 19 Summary Today',
                        size: 40,
                        color: 0xFFFFFFFF,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Image.asset(
                      'assets/Icon/Icon_main.png',
                      scale: 1.5,
                    ),
                  ),
                  SpinKitFadingCircle(
                    color: Colors.white,
                    size: 50.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
