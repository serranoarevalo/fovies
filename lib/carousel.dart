import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  Carousel({Key key, @required this.child}) : super(key: key);

  final Widget child;

  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacityAnimation;
  Animation<double> translateAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });

    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);
    translateAnimation = Tween(begin: 10.0, end: 0.0).animate(controller);

    controller.forward();
  }

  @override
  void didUpdateWidget(Carousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.reset();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.translate(
        offset: Offset(0, translateAnimation.value),
        child: Opacity(
          opacity: opacityAnimation.value,
          child: widget.child,
        ),
      ),
    );
  }
}
