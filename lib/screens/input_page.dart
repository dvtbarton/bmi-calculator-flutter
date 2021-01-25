import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../constants.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import 'results_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../calculate_bmi.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = INACTIVE_CARD_COLOR;
  Color femaleCardColor = INACTIVE_CARD_COLOR;
  int userHeight = 180; // cm
  int userWeight = 60; // kg
  int userAge = 18; // millennia

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          maleCardColor = ACTIVE_CARD_COLOR;
                          femaleCardColor = INACTIVE_CARD_COLOR;
                        });
                      },
                      cardColor: maleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        iconText: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          maleCardColor = INACTIVE_CARD_COLOR;
                          femaleCardColor = ACTIVE_CARD_COLOR;
                        });
                      },
                      cardColor: femaleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        iconText: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: LABEL_TEXT_STYLE,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          userHeight.toString(),
                          style: BIG_NUMBER_STYLE,
                        ),
                        Text(
                          'cm',
                          style: LABEL_TEXT_STYLE,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                          value: userHeight.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              userHeight = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardColor: ACTIVE_CARD_COLOR,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: LABEL_TEXT_STYLE,
                          ),
                          Text(
                            userWeight.toString(),
                            style: BIG_NUMBER_STYLE,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    userWeight--;
                                  });
                                },
                              ),
                              SizedBox(width: 12),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    userWeight++;
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
                    child: ReusableCard(
                      cardColor: ACTIVE_CARD_COLOR,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: LABEL_TEXT_STYLE,
                          ),
                          Text(
                            userAge.toString(),
                            style: BIG_NUMBER_STYLE,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    userAge--;
                                  });
                                },
                              ),
                              SizedBox(width: 12),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    userAge++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE YOUR BMI',
              buttonTap: () {
                BMIFunctions calc =
                    BMIFunctions(height: userHeight, weight: userWeight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      bmiResultText: calc.getResult(),
                      bmiInterpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
