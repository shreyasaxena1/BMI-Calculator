import 'file:///C:/Users/shrey/OneDrive/Desktop/bmi-calculator-flutter-master/lib/component/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/component/bottom_button.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: Reuseablecard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kInterpretationOfBMI,
                    ),
                  ],
                ),
              )),
          BottomButtom(
            onTapping: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    // take this page and return result page
                    return InputPage();
                  },
                ),
              );
            },
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
