import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shabadabada/models/team.dart';

class TeamBoardWidget extends StatefulWidget {

  TeamBoardWidget({Key key, @required Team this.team, @required this.onTimeElapsed, @required this.onAnswer}) : super(key: key);

  final Team team;
  final Function onTimeElapsed;
  final Function onAnswer;
  
  @override
  State<StatefulWidget> createState() => new TeamBoardWidgetState();
}

class TeamBoardWidgetState extends State<TeamBoardWidget> {

  int resetTime = 30;
  int remainingTime;

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  startTimeout() {
    remainingTime = resetTime;
    new Timer.periodic(new Duration(seconds: 1), handleTimeout);
  }

  void handleTimeout(timer) {
    setState(() {
      if(widget.team.active) {
        if(remainingTime > 0) {
          remainingTime--;
        }
        else if(remainingTime == 0){
          remainingTime = resetTime;
          widget.onTimeElapsed(widget.team);
        }
      }
    });
  }

  void handleTap() {
    if(widget.team.active) {
      remainingTime = resetTime;
      widget.onAnswer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: handleTap,
      child: new Container(
          decoration: new BoxDecoration(color: Colors.grey),
          child: new Column(
            children: <Widget>[
              new LinearProgressIndicator(
                value: remainingTime * 100.0 / resetTime * .01
              ),
              new Align(
                alignment: Alignment.topRight,
                child: new Text(
                    '$remainingTime'
                )
              )
            ]
          )
      )
    );
  }

}