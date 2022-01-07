import 'package:flutter/material.dart';
import 'body.dart';

class PlayGround extends StatefulWidget {

  @override
  _PlayGroundState createState() => _PlayGroundState();
}

class _PlayGroundState extends State<PlayGround> {

  GlobalKey innerContainerKey = GlobalKey();
  Offset offset;
  double bodySize = 50, bodyPadding = -5;
  bool canMove = false;
  double step = 5, xStep, yStep;

  Offset offset1;
  double step1 = 7, xStep1, yStep1;

  @override
  void initState() {
    xStep = step;
    yStep = step;
    offset = Offset(bodyPadding, bodyPadding);

    xStep1 = step1;
    yStep1 = step1;
    offset1 = Offset(0, 150);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(canMove? Icons.pause: Icons.play_arrow),
        onPressed: (){
          canMove = canMove? false: true;
          setState(() { });
        },
      ),
      body: SafeArea(
        child: Container(
          color: Colors.pinkAccent,
          padding: EdgeInsets.all(5),
          child: Container(
            key: innerContainerKey,
            color: Colors.lightGreenAccent,
            child: Stack(
              children: <Widget>[
                Body(
                  // child: Icon(Icons.sports_volleyball, size: bodySize, color: Colors.brown),
                  child: Container(
                    alignment: Alignment.center,
                    width: bodySize,
                    height: bodySize,
                    child: Text('${offset.dx}, ${offset.dy}', textAlign: TextAlign.center),
                    color: Colors.yellow,
                  ),
                  offset: offset,
                  xVelocity: xStep,
                  yVelocity: yStep,
                  canMove: canMove,
                  onMove: (offset){
                    move(offset);
                  },
                ),
                Body(
                  // child: Icon(Icons.sports_basketball_sharp, size: bodySize, color: Colors.black),
                  child: Container(
                    alignment: Alignment.center,
                    width: bodySize,
                    height: bodySize,
                    child: Text('${offset1.dx}, ${offset1.dy}', textAlign: TextAlign.center),
                    color: Colors.cyan,
                  ),
                  offset: offset1,
                  xVelocity: xStep1,
                  yVelocity: yStep1,
                  canMove: canMove,
                  delay: 20,
                  onMove: (offset){
                    move1(offset);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void move(Offset offset) async {
    double groundWidth = innerContainerKey.currentContext.size.width;
    double groundHeight = innerContainerKey.currentContext.size.height;

    if(offset.dx <= 0 +bodyPadding){
      xStep = step;
    }
    if(offset.dx >= groundWidth-bodySize -bodyPadding){
      xStep = -step;
    }

    if(offset.dy >= groundHeight-bodySize -bodyPadding){
      yStep = -step;
    }
    if(offset.dy <= 0 +bodyPadding){
      yStep = step;
    }

    this.offset = offset;
    if(mounted){
      setState(() { });
    }
  }

  void move1(Offset offset1) async {
    double groundWidth = innerContainerKey.currentContext.size.width;
    double groundHeight = innerContainerKey.currentContext.size.height;

    if(offset1.dx <= 0 +bodyPadding){
      xStep1 = step1;
    }
    if(offset1.dx >= groundWidth-bodySize -bodyPadding){
      xStep1 = -step1;
    }

    if(offset1.dy >= groundHeight-bodySize -bodyPadding){
      yStep1 = -step1;
    }
    if(offset1.dy <= 0 +bodyPadding){
      yStep1 = step1;
    }

    if((0 <= (offset1.dx - offset.dx).abs() && (offset1.dx - offset.dx).abs() <= bodySize) && (0 <= (offset1.dy - offset.dy).abs() && (offset1.dy - offset.dy).abs() <= bodySize)) {
      xStep = -xStep;
      yStep = -yStep;

      xStep1 = -xStep1;
      yStep1 = -yStep1;
    }

    this.offset1 = offset1;
    if(mounted){
      setState(() { });
    }
  }
}
