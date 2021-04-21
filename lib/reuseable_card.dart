import 'package:flutter/material.dart';

class Reuseablecard extends StatelessWidget {
  Reuseablecard({@required this.colour, this.carChild , this.onTapping});

  final Color colour; // final make immutable
  final Widget carChild;
  final Function onTapping;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapping,
      child: Container(
        child: carChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
