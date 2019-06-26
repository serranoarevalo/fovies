import 'package:flutter/material.dart';
import 'package:fovies/carousel.dart';
import 'package:fovies/tabs.dart';

class Movies extends StatefulWidget {
  Movies({Key key}) : super(key: key);

  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  int selected = 0;

  void changeIndex(int index) {
    setState(() {
      selected = index;
    });
  }

  Widget buildCards() {
    if (selected == 0) {
      return Text("Zero");
    } else if (selected == 1) {
      return Text("One");
    } else if (selected == 2) {
      return Text("Two");
    } else if (selected == 3) {
      return Text("Three");
    }
    return Text("");
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
            child: Carousel(
              child: buildCards(),
            ),
          )
        ],
      ),
    );
  }
}
