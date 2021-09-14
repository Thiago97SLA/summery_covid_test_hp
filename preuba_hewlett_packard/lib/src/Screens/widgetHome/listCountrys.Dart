import 'package:flutter/material.dart';

import 'package:preuba_hewlett_packard/src/widget/FontStyleText.Dart';

class ListCountrys extends StatelessWidget {
  final dynamic data;
  const ListCountrys({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data[1]);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return showmoreinfo(data[index]);
                    });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.network(
                          'https://flagcdn.com/w160/${data[index]['CountryCode'].toLowerCase()}.png',
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            child: Icon(Icons.broken_image,
                                color: Color(0xFF1C1066)),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFC4C4C4), width: 1),
                          color: Color(0xFFC4C4C4),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      width: 70,
                      height: 70,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          containerText(data[index]['CountryCode'], ''),
                          containerText(data[index]['Country'], ''),
                          containerText('New record:',
                              data[index]['NewRecovered'].toString()),
                          containerText('Total deaths:',
                              data[index]['TotalDeaths'].toString())
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget showmoreinfo(dynamic data) {
  return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 15),
              child: SingleChildScrollView(
                  child: ListBody(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 10, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Image.network(
                              'https://flagcdn.com/w160/${data['CountryCode'].toLowerCase()}.png',
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                child: Icon(Icons.broken_image,
                                    color: Color(0xFF1C1066)),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFC4C4C4), width: 1),
                              color: Color(0xFFC4C4C4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          width: 70,
                          height: 70,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 40,
                            alignment: Alignment.centerLeft,
                            child: FontWidget(
                                overflow: TextOverflow.ellipsis,
                                text: data['Country'],
                                size: 20,
                                color: 0xFF000000,
                                fontWeight: FontWeight.w700,
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                  ),
                  containerTextDialog(
                      'New Confirmed', data['NewConfirmed'].toString()),
                  containerTextDialog(
                      'Total Confirmed', data['TotalConfirmed'].toString()),
                  containerTextDialog(
                      'New Deaths', data['NewDeaths'].toString()),
                  containerTextDialog(
                      'Total Deaths', data['TotalDeaths'].toString()),
                  containerTextDialog(
                      'New Recovered', data['NewRecovered'].toString()),
                  containerTextDialog(
                      'Total Recovered', data['TotalRecovered'].toString()),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: FontWidget(
                        overflow: TextOverflow.ellipsis,
                        text: data['Date'],
                        size: 14,
                        color: 0xFFc4c4c4,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center),
                  ),
                ],
              )),
            ),
          ),
        ],
      ));
}

Widget containerTextDialog(String text, String numdata) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FontWidget(
            text: text,
            size: 14,
            color: 0xFF000000,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center),
        FontWidget(
            text: numdata,
            size: 18,
            color: 0xFF5B00B6,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center),
      ],
    ),
  );
}

Widget containerText(String text, String numdata) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      FontWidget(
          text: text,
          size: 14,
          color: 0xFF000000,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center),
      FontWidget(
          text: numdata,
          size: 18,
          color: 0xFF000000,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center),
    ],
  );
}
