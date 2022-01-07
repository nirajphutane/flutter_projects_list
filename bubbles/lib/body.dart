import 'package:flutter/material.dart';

class Body extends StatelessWidget {

  final Widget child;
  final Offset offset;
  final double xVelocity, yVelocity;
  final bool canMove;
  final Function onMove;
  final delay;

  Body({
    @required this.child,
    @required this.offset,
    @required this.xVelocity,
    @required this.yVelocity,
    @required this.canMove,
    @required this.onMove,
    this.delay
  }){
    moving();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: child,
    );
  }

  void moving() async {
    if(canMove){
      await Future.delayed(Duration(milliseconds: delay?? 10));
      onMove(Offset(offset.dx+xVelocity, offset.dy+yVelocity));
    }
  }
}
