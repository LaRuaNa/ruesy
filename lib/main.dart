import 'package:flutter/material.dart';

import 'package:ruesy/screens/card_screen.dart';
import 'package:ruesy/screens/app.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      title: 'Ruesy',
      home: App(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => App(),
        '/card': (BuildContext context) => CardScreen(),
      },
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('tetet'),
    );
  }
}