import 'package:flutter/material.dart';
import 'package:fovies/data.dart';

class Carousel extends StatefulWidget {
  Carousel({Key key, @required this.data, @required this.loading})
      : super(key: key);

  final List<Movie> data;
  final bool loading;

  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.85);
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
          ? PageView(
              scrollDirection: Axis.horizontal,
              controller: controller,
              children: widget.data
                  .asMap()
                  .map((index, movie) => MapEntry(
                      index,
                      Transform.scale(
                          scale: (1 -
                              (((page - index).abs() * 0.1).clamp(0.0, 1.0))),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(movie.poster))),
                          ))))
                  .values
                  .toList())
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator()],
            ),
    );
  }
}
