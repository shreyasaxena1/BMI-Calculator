import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';

//define at top
const heightOfBottomContainer = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const colorOfBottomContainer = Color(0xFFEB1555);
enum GenderEnum { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderEnum selectedGender;

  //define both separately because we need to set onTap colors
  //Color maleCardColor = inactiveCardColor;
  //Color femaleCardColor = inactiveCardColor;

  // //Male - 1 : Female - 2
  // void updateColor(GenderEnum gender) {
  //   //Male
  //   if (gender == GenderEnum.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else
  //       maleCardColor = inactiveCardColor;
  //   }
  //   if (gender == GenderEnum.female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = GenderEnum.male;
                      });
                    },
                    child: Reuseablecard(
                      colour: selectedGender == GenderEnum.male ? activeCardColor : inactiveCardColor,
                      carChild: IconContent(
                          genderText: 'MALE',
                          genderIcon: FontAwesomeIcons.mars),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = GenderEnum.female;
                      });
                    },
                    child: Reuseablecard(
                      colour: selectedGender==GenderEnum.female ? activeCardColor : inactiveCardColor,
                      carChild: IconContent(
                        genderText: 'FEMALE',
                        genderIcon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: Reuseablecard(colour: activeCardColor),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: Reuseablecard(colour: activeCardColor),
                ),
                Expanded(
                  child: Reuseablecard(colour: activeCardColor),
                ),
              ],
            )),
            Container(
              color: colorOfBottomContainer,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: heightOfBottomContainer,
            )
          ],
        ));
  }
}
