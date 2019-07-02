import 'package:flutter/material.dart';
import 'package:fovies/data.dart';
import 'package:fovies/detail.dart';

class Carousel extends StatefulWidget {
  Carousel({Key key, @required this.data, @required this.loading})
      : super(key: key);

  final List<Movie> data;
  final bool loading;

  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.80);
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
                      CarouselCard(
                          poster: movie.poster,
                          title: movie.title,
                          opacity:
                              (1 - (((page - index).abs()).clamp(0.0, 0.5))),
                          scale: (1 -
                              (((page - index).abs() * 0.1).clamp(0.0, 1.0))))))
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

class CarouselCard extends StatelessWidget {
  CarouselCard(
      {@required this.poster,
      @required this.title,
      @required this.scale,
      @required this.opacity});

  final String poster;
  final String title;
  final double scale;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(pageBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return Detail(
              poster: poster,
            );
          }, transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(opacity: animation, child: child);
          }),
        );
      },
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Transform.scale(
                scale: scale,
                child: Hero(
                  tag: poster,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      image: DecorationImage(
                        image: NetworkImage(poster),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Opacity(
                opacity: opacity,
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                ),
              ),
            )
          ]),
    );
  }
}
