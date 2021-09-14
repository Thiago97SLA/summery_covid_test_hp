import 'package:flutter/material.dart';

import 'package:preuba_hewlett_packard/src/routes/Router.Dart';
import 'package:preuba_hewlett_packard/src/Screens/InitApp.Dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Hewlett Packard',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScreenInit(),
      routes: getApplicationRoutes(),
    );
  }
}
