import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  Carousel({Key key, @required this.child}) : super(key: key);

  final Widget child;

  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void didUpdateWidget(Carousel oldWidget) {
    controller.reset();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Opacity(
        opacity: animation.value,
        child: widget.child,
      ),
    );
  }
}
