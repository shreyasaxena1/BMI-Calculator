import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/component/icon_content.dart';
import 'package:bmi_calculator/component/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'results.dart';
import 'package:bmi_calculator/component/bottom_button.dart';
import 'package:bmi_calculator/calculateBmi.dart';
//define at top
enum GenderEnum { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderEnum selectedGender;
  int height = 180;
  int weight = 50;
  int age = 20;

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
                    cardChild: IconContent(
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
                    cardChild: IconContent(
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
                cardChild: Column(
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
                        inactiveTrackColor: Color(0xFF8D8E98),
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
                  child: Reuseablecard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              ' Kg',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              iconOfRoundIcon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              iconOfRoundIcon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseablecard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              ' yrs',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              iconOfRoundIcon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              iconOfRoundIcon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            BottomButtom(
              onTapping: () {
                CalculateBMI cal = CalculateBMI(height: height , weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // take this page and return result page
                      return ResultsPage(
                        bmiResult: cal.calculateBmi() ,
                        resultText: cal.getResults(),
                        interpretation: cal.getInterpretation() ,
                      );
                    },
                  ),
                );
              },
              buttonTitle: 'CALCULATE',
            ),
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconOfRoundIcon, this.onPressed});

  final IconData iconOfRoundIcon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(iconOfRoundIcon),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4f5e),
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
    );
  }
}
