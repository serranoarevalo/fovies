import 'package:flutter/material.dart';
import 'package:fovies/movies.dart';

void main() => runApp(Fovies());

class Fovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(left: 35, top: 125),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Movies",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              Movies()
            ],
          ),
        ),
      ),
    );
  }
}
