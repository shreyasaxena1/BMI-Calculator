import 'package:flutter/material.dart';

class Reuseablecard extends StatelessWidget {
  Reuseablecard({@required this.colour, this.carChild});

  final Color colour; // final make immutable
  final Widget carChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: carChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
