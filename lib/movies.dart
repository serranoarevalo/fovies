import 'package:flutter/material.dart';
import 'package:fovies/carousel.dart';
import 'package:fovies/data.dart';
import 'package:fovies/tabs.dart';

class Movies extends StatefulWidget {
  Movies({Key key, @required this.nowPlaying}) : super(key: key);

  final Future<List<Movie>> nowPlaying;

  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  int selected = 0;

  void changeIndex(int index) {
    if (selected == index) {
      return;
    }
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: <Widget>[
          Tabs(
            selected: selected,
            changeIndex: this.changeIndex,
          ),
          Container(
              height: MediaQuery.of(context).size.height / 1.7,
              child: FutureBuilder(
                  key: UniqueKey(),
                  future: widget.nowPlaying,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Movie>> snapshot) {
                    return Carousel(
                        data: snapshot.data, loading: !snapshot.hasData);
                  })),
        ],
      ),
    );
  }
}
