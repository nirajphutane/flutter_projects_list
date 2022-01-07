import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GlobalKey innerContainerKey = GlobalKey();
  Offset offset1 = Offset.zero;
  Offset offset;
  double boxSize = 50, ballPadding = -5;
  bool canStart = false;
  double step = 5, xStep, yStep;

  @override
  void initState() {
    xStep = step;
    yStep = step;
    offset = Offset(ballPadding, ballPadding);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.pinkAccent,
          padding: EdgeInsets.all(5),
          child: Container(
            key: innerContainerKey,
            color: Colors.lightGreenAccent,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: offset.dx,
                  top: offset.dy,
                  child: GestureDetector(
                    onPanStart: (details){
                      canStart = false;
                      play();
                    },
                    onPanEnd: (details){
                      canStart = true;
                      play();
                    },
                    onPanUpdate: (details) {
                      double x = offset.dx + details.delta.dx;
                      x = x < 0? 0: x;  // left limit
                      x = x > innerContainerKey.currentContext.size.width-boxSize? innerContainerKey.currentContext.size.width-boxSize: x;  // right limit
                      double y = offset.dy + details.delta.dy;
                      y = y < 0? 0: y;  // top limit
                      y = y > innerContainerKey.currentContext.size.height-boxSize? innerContainerKey.currentContext.size.height-boxSize: y;  // bottom limit
                      setState(() {
                        offset = Offset(x, y);
                      });
                    },
                    child: Container(
                      child: Icon(Icons.sports_volleyball, size: boxSize, color: Colors.brown)),
                  ),
                ),

                // Positioned(
                //   left: offset1.dx,
                //   top: offset1.dy,
                //   child: GestureDetector(
                //     onPanUpdate: (details) {
                //       double x = offset1.dx + details.delta.dx;
                //       x = x < 0? 0: x;  // left limit
                //       x = x > innerContainerKey.currentContext.size.width-boxSize? innerContainerKey.currentContext.size.width-boxSize: x;  // right limit
                //       double y = offset1.dy + details.delta.dy;
                //       y = y < 0? 0: y;  // top limit
                //       y = y > innerContainerKey.currentContext.size.height-boxSize? innerContainerKey.currentContext.size.height-boxSize: y;  // bottom limit
                //       setState(() {
                //         offset1 = Offset(x, y);
                //       });
                //     },
                //     child: Container(
                //       width: boxSize, height: boxSize, color: Colors.green,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(canStart? Icons.stop: Icons.play_arrow),
        onPressed: (){
          canStart = canStart? false: true;
          play();
        },
      ),
    );
  }

  void play() async {
    double groundWidth = innerContainerKey.currentContext.size.width;
    double groundHeight = innerContainerKey.currentContext.size.height;
    while(canStart){
      await Future.delayed(Duration(milliseconds: 10));
      double x = offset.dx;
      if(x <= 0 +ballPadding){
        xStep = step;
      }
      if(x >= groundWidth-boxSize -ballPadding){
        xStep = -step;
      }
      x = x + xStep;

      double y = offset.dy;
      if(y >= groundHeight-boxSize -ballPadding){
        yStep = -step;
      }
      if(y <= 0 +ballPadding){
        yStep = step;
      }
      y = y + yStep;

      if(mounted){
        setState(() {
          offset = Offset(x, y);
        });
      }
    }
  }
}
