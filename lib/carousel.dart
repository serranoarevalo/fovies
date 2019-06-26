import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  Carousel({Key key, @required this.children, @required this.currentSelected})
      : super(key: key);

  final List<Widget> children;
  final int currentSelected;
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSwitcher(
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          final offsetAnimation =
              Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, -1.0))
                  .animate(animation);
          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        duration: Duration(milliseconds: 300),
        child: widget.children[widget.currentSelected],
      ),
    );
  }
}
