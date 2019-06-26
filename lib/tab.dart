import 'package:flutter/material.dart';

class MovieTab extends StatelessWidget {
  MovieTab(
      {@required this.isSelected, @required this.label, @required this.onTap});

  final bool isSelected;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        margin: EdgeInsets.only(right: 40),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.black : Colors.grey),
        ),
      ),
    );
  }
}
