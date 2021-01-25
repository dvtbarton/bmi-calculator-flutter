import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ResultsPage extends StatelessWidget {
  // Constructor
  ResultsPage(
      {@required this.bmiResult,
      @required this.bmiResultText,
      @required this.bmiInterpretation});

  final String bmiResult;
  final String bmiResultText;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TITLE_STYLE,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColor: ACTIVE_CARD_COLOR,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiResultText.toUpperCase(),
                    style: RESULTS_TEXT_STYLE,
                  ),
                  Text(
                    bmiResult,
                    style: BMI_TEXT_STYLE,
                  ),
                  Text(
                    bmiInterpretation,
                    style: BODY_TEXT_STYLE,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              buttonTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
