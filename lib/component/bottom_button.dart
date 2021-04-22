import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButtom extends StatelessWidget {
  BottomButtom({@required this.onTapping, @required  this.buttonTitle});

  final Function onTapping;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapping,
      child: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        color: kColorOfBottomContainer,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kHeightOfBottomContainer,
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButton,
          ),
        ),
      ),
    );
  }
}
