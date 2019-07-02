import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({Key key, @required this.poster}) : super(key: key);

  final String poster;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 500,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Hero(
                      tag: poster,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(poster),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([Text("Hi")]),
          )
        ],
      ),
    );
  }
}
