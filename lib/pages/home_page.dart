import 'package:flutter/material.dart';
import 'package:shabadabada/pages/game_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text(title),
        ),
        body: new Center(
          child: new RaisedButton(
            onPressed: () => Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => new GamePage(title: title,))),
            child: new Text("Play")
          )
        )
    );
  }

}