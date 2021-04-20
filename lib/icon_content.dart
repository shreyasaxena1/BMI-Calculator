import 'package:flutter/material.dart';

const genderTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class IconContent extends StatelessWidget {
  final String genderText;
  final IconData genderIcon;

  IconContent({@required this.genderText, this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 85.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderText,
          style: genderTextStyle,
        ),
      ],
    );
  }
}
