import 'package:flutter/material.dart';
import 'bmi_calculator.dart';
import 'nav_button.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'input_page.dart';

const Map<BMIResult, String> bmiDescription = {
  BMIResult.normal: 'You have a normal body weight. Good job!',
  BMIResult.overweight:
      'Your body weight is above average. Try to eat fewer calories and exercise more.',
  BMIResult.underweight:
      'Your body weight is below average. Try to eat more calories.',
};
const Map<BMIResult, String> bmiResultString = {
  BMIResult.normal: 'NORMAL',
  BMIResult.overweight: 'OVERWEIGHT',
  BMIResult.underweight: 'UNDERWEIGHT',
};

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.bmi,
    @required this.bmiResult,
    @required this.normalRange,
  });

  final double bmi;
  final BMIResult bmiResult;
  final String normalRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Your Result',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kInactiveCardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              bmiResultString[bmiResult],
                              style: TextStyle(
                                color: Color(0xFF21BB6B),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              bmi.toStringAsFixed(1),
                              style: TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  'Normal BMI range:',
                                  style: kResultLabelTextStyle,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  normalRange,
                                  style: kResultDescriptionTextStyle,
                                ),
                              ],
                            ),
                            Text(
                              bmiDescription[bmiResult],
                              style: kResultDescriptionTextStyle,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          NavButton(
            text: 'RECALCULATE BMI',
            navigationPage: InputPage(),
            navigationMethod: Navigator.pop,
          ),
        ],
      ),
    );
  }
}
