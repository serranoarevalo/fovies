import 'package:flutter/material.dart';
import 'package:fovies/tab.dart';

class Tabs extends StatelessWidget {
  Tabs({@required this.selected, @required this.changeIndex});

  final int selected;
  final Function changeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 300,
            child: ListView(
              padding: EdgeInsets.only(left: 35),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                MovieTab(
                  onTap: () {
                    changeIndex(0);
                  },
                  isSelected: selected == 0,
                  label: "New Releases",
                ),
                MovieTab(
                  onTap: () {
                    changeIndex(1);
                  },
                  isSelected: selected == 1,
                  label: "Upcoming",
                ),
                MovieTab(
                  onTap: () {
                    changeIndex(2);
                  },
                  isSelected: selected == 2,
                  label: "Popular",
                ),
                MovieTab(
                  onTap: () {
                    changeIndex(3);
                  },
                  isSelected: selected == 3,
                  label: "Top Rated",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
