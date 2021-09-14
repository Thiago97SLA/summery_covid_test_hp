import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:preuba_hewlett_packard/src/widget/Backgrounp.Dart';
import 'package:preuba_hewlett_packard/src/service/GetSummery.Dart';
import 'package:preuba_hewlett_packard/src/widget/FontStyleText.Dart';
import 'package:preuba_hewlett_packard/src/Screens/widgetHome/listCountrys.Dart';
import 'package:preuba_hewlett_packard/src/Screens/widgetHome/ContainerGlobalInfo.Dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5B00B6),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FontWidget(
                      text: 'Summary',
                      size: 30,
                      color: 0xFFFFFFFF,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center),
                ),
                Image.asset(
                  'assets/Icon/Icon_main.png',
                  scale: 8,
                ),
              ],
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Background('assets/background/Home.png'),
          ListView(
            shrinkWrap: true,
            children: [
              FutureBuilder(
                future: getSummary(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return snapshot.hasData
                      ? ContainerInfo(data: snapshot.data)
                      : Container(
                          child: LinearProgressIndicator(
                              backgroundColor: Color(0xFFD5EAFF),
                              valueColor: AlwaysStoppedAnimation(
                                Color(0xFF1C1066),
                              )));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class ContainerInfo extends StatelessWidget {
  final dynamic data;
  const ContainerInfo({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic datadetcode = json.decode(data);

    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        BoxTitleGlobal(
          text: 'Global Summery',
        ),
        ContainerGlobalInfo(data: datadetcode['Global']),
        BoxTitleGlobal(
          text: 'Countrys Summery',
        ),
        ListCountrys(
          data: datadetcode['Countries'],
        ),
      ],
    );
  }
}

class BoxTitleGlobal extends StatelessWidget {
  final String text;

  const BoxTitleGlobal({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: FontWidget(
              text: text,
              size: 20,
              color: 0xFF000000,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
