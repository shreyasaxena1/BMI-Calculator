import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';
import 'constants.dart';

//define at top
enum GenderEnum { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderEnum selectedGender;
  int height = 180;

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: Reuseablecard(
                    onTapping: () {
                      setState(() {
                        selectedGender = GenderEnum.male;
                      });
                    },
                    colour: selectedGender == GenderEnum.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    carChild: IconContent(
                        genderText: 'MALE', genderIcon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: Reuseablecard(
                    onTapping: () {
                      setState(() {
                        selectedGender = GenderEnum.female;
                      });
                    },
                    colour: selectedGender == GenderEnum.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    carChild: IconContent(
                      genderText: 'FEMALE',
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: Reuseablecard(
                colour: kActiveCardColor,
                carChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor : Color(0xFF8D8E98),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: Reuseablecard(colour: kActiveCardColor),
                ),
                Expanded(
                  child: Reuseablecard(colour: kActiveCardColor),
                ),
              ],
            )),
            Container(
              color: kColorOfBottomContainer,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kHeightOfBottomContainer,
            )
          ],
        ));
  }
}
