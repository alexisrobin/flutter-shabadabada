import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shabadabada/models/team.dart';
import 'package:shabadabada/widgets/team_board_widget.dart';

class GamePage extends StatefulWidget {
  GamePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  GamePageState createState() => new GamePageState();
}

class GamePageState extends State<GamePage> {

  TeamBoardWidget tbWidget1;
  TeamBoardWidget tbWidget2;

  @override
  void initState() {
    super.initState();
    tbWidget1 = new TeamBoardWidget(team: new Team(), onAnswer: onAnswer, onTimeElapsed: onTimeElapsed);
    tbWidget2 = new TeamBoardWidget(team: new Team(), onAnswer: onAnswer, onTimeElapsed: onTimeElapsed);
    tbWidget1.team.active = true;
  }

  void onAnswer() {
    tbWidget1.team.active = !tbWidget1.team.active;
    tbWidget2.team.active = !tbWidget2.team.active;
  }

  void onTimeElapsed(Team team) {
    team.active = ! team.active;
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: new RotationTransition(
                    turns: new AlwaysStoppedAnimation(180 / 360),
                    child: tbWidget1
                )
              ),
              new Expanded(
                child: tbWidget2
              )
            ]
          ),
        )
    );
  }
}

