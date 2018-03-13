import 'package:flutter/material.dart';
import 'package:shabadabada/pages/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final String title = "shabadabada";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: new HomePage(title: title),
    );
  }
}