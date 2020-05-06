import 'package:flutter/material.dart';
import 'nav_button.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
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
                              'NORMAL',
                              style: TextStyle(
                                color: Color(0xFF21BB6B),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '21.8',
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
                                  '18.5 - 25',
                                  style: kResultDescriptionTextStyle,
                                ),
                              ],
                            ),
                            Text(
                              'You have a normal body weight. Good job!',
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
