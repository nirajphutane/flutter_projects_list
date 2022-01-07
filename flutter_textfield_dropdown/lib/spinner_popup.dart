import 'package:flutter/material.dart';

class Spinner extends PopupRoute{

  late List items;
  late Function onSelected;
  late GlobalKey textKey, iconKey;
  Spinner({required this.items, required this.onSelected, required this.textKey, required this.iconKey});

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Spinner';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return SpinnerBody(
      items: items, onSelected: onSelected, iconKey: iconKey, textKey: textKey,
    );
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);
}

class SpinnerBody extends StatefulWidget{

  final List items;
  final Function onSelected;
  final GlobalKey textKey, iconKey;

  SpinnerBody({required this.items, required this.onSelected, required this.textKey, required this.iconKey});

  @override
  State<StatefulWidget> createState() => SpinnerBodyState();
}

class SpinnerBodyState extends State<SpinnerBody>{

  @override
  Widget build(BuildContext context) {
    List list = _calculate();
    return Stack(
      children: [
        Container(
          child: Positioned(
            width: list[0].width,
            height: list[0].height,
            left: list[1].dx,
            top: list[1].dy,
            child: Scaffold(
              body: Card(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: widget.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        alignment: Alignment.center,
                        height: list[2],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${widget.items[index]}',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                              height: 0.5,
                              color: Colors.grey,
                            )
                          ],
                        )
                      ),
                      onTap: (){
                        widget.onSelected(index, widget.items[index]);
                      },
                    );
                  }
                ),
              )
            )
          ),
        ),
      ],
    );
  }

  List _calculate() {
    RenderBox? iconBox = widget.iconKey.currentContext!.findRenderObject() as RenderBox;
    RenderBox? textBox = widget.textKey.currentContext!.findRenderObject() as RenderBox;
    double xOffset = _getXOffset(iconBox.localToGlobal(Offset.zero).dx + iconBox.size.width/2 , textBox.size.width);
    Map<String, double> y = _getY(iconBox, textBox.size.height, widget.items.length);
    Size size = Size(textBox.size.width, y['Height']!);
    Offset offset = Offset(xOffset, y['yOffset']!);
    return[size, offset, textBox.size.height];
  }

  double _getXOffset(double dx, double width) {
    double center = width/2;

    /*Right Side*/
    if(dx+center > MediaQuery.of(context).size.width){
      double remaining = MediaQuery.of(context).size.width - center;
      return remaining - center;
    }
    /*Left Side*/
    else if(dx-center < 0){
      return 0;
    }
    /*Center*/
    return dx-center;
  }

  Map<String, double> _getY(RenderBox renderBox, double height, int count) {
    double dy = renderBox.localToGlobal(Offset.zero).dy;
    double totalHeight = height * count;
    double yOffset;

    /*if dy is in upper side*/
    if(dy < MediaQuery.of(context).size.height/3){
      yOffset = dy+renderBox.size.height;
      /*if height is greater than bottom free space*/
      if(totalHeight > (MediaQuery.of(context).size.height - dy)) {
        totalHeight = MediaQuery.of(context).size.height - (dy + renderBox.size.height);
      }
    }
    /*if dy is in lower side*/
    else {
      /*if height is greater than bottom free space*/
      if(totalHeight > (MediaQuery.of(context).size.height - dy)) {
        /*if height is less than dy*/
        if(totalHeight < dy){
          yOffset = dy-totalHeight;
        } else {
          totalHeight = dy;
          yOffset = 10;
        }
      } else {
        yOffset = dy + renderBox.size.height;
      }
    }
    return{
      'Height': totalHeight,
      'yOffset': yOffset
    };
  }
}