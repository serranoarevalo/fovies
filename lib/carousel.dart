import 'package:flutter/material.dart';
import 'package:fovies/data.dart';

class Carousel extends StatefulWidget {
  Carousel({Key key, @required this.futures, @required this.currentSelected})
      : super(key: key);

  final List<Future<List<Movie>>> futures;
  final int currentSelected;
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      key: UniqueKey(),
      future: widget.futures[widget.currentSelected],
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          return Container(
              decoration: BoxDecoration(color: Colors.red),
              height: MediaQuery.of(context).size.height / 2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(snapshot.data[index].title);
                  }));
        }
        return CircularProgressIndicator();
      },
    );
  }
}
