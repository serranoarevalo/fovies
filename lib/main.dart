import 'package:flutter/material.dart';
import 'package:fovies/movies.dart';
import 'package:fovies/data.dart';

void main() => runApp(Fovies());

class Fovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(top: 125),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 35),
                child: Text(
                  "Movies",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                ),
              ),
              Movies(
                  nowPlaying: getNowPlaying(),
                  upcoming: getUpcoming(),
                  popular: getPopular(),
                  topRated: getTopRated())
            ],
          ),
        ),
      ),
    );
  }
}
