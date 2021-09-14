import 'package:flutter/material.dart';

import 'package:preuba_hewlett_packard/src/widget/FontStyleText.Dart';

class ContainerGlobalInfo extends StatelessWidget {
  final dynamic data;
  const ContainerGlobalInfo({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Image.asset('assets/img/imgworld.png', scale: 2),
              boxinf('New Confirmed', data['NewConfirmed'].toString()),
              boxinf('Total Confirmed', data['TotalConfirmed'].toString()),
              boxinf('New Deaths', data['NewDeaths'].toString()),
              boxinf('Total Deaths', data['TotalDeaths'].toString()),
              boxinf('New Recovered', data['NewRecovered'].toString()),
              boxinf('Total Recovered', data['TotalRecovered'].toString()),
            ],
          ),
        ),
      ),
    );
  }
}

Widget boxinf(String text, String datanum) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: FontWidget(
              text: text,
              size: 14,
              color: 0xFF000000,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center),
        ),
        Expanded(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 1,
                color: Color(
                  0xFFC4C4C4,
                ))),
        Container(
          child: FontWidget(
              text: datanum,
              size: 18,
              color: 0xFF5B00B6,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center),
        ),
      ],
    ),
  );
}
