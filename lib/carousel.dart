import 'package:flutter/material.dart';
import 'package:fovies/data.dart';
import 'dart:math';

class Carousel extends StatefulWidget {
  Carousel({Key key, @required this.data, @required this.loading})
      : super(key: key);

  final List<Movie> data;
  final bool loading;

  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.9);
  dynamic page = 0.0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        page = controller.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.7,
      child: !widget.loading
          ? PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.data.length,
              controller: controller,
              itemBuilder: (BuildContext context, int index) {
                return Transform.scale(
                  scale: max(0.9, 1.0 - (index - page).abs()),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(widget.data[index].poster))),
                  ),
                );
              },
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator()],
            ),
    );
  }
}
