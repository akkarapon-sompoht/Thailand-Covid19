import 'package:flutter/material.dart';
import 'package:getAPIDemos/welcome.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(title: 'Thailand Covid-19 Stat'),
    );
  }
}
