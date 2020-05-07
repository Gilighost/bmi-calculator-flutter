import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmi_calculator.dart';
import 'icon_content.dart';
import 'nav_button.dart';
import 'plus_minus_selector_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';

const averageFemaleHeight = 63;
const averageMaleHeight = 69;
const averageFemaleWeight = 170;
const averageMaleWeight = 190;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  static Gender selectedGender = Gender.male;
  static int selectedHeight = averageMaleHeight;
  static int selectedWeight = averageMaleWeight;
  static int selectedAge = 25;

  Function selectGender(Gender gender) => () {
        setState(() {
          selectedGender = gender;

          if (selectedHeight == averageFemaleHeight ||
              selectedHeight == averageMaleHeight) {
            selectedHeight =
                gender == Gender.male ? averageMaleHeight : averageFemaleHeight;
          }

          if (selectedWeight == averageFemaleWeight ||
              selectedWeight == averageMaleWeight) {
            selectedWeight =
                gender == Gender.male ? averageMaleWeight : averageFemaleWeight;
          }
        });
      };

  String displayInchesInFeet(int inches) => '${inches ~/ 12}\'${inches % 12}"';

  @override
  Widget build(BuildContext context) {
    double bmi = BMICalculator.calculateBMI(selectedHeight, selectedWeight);
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
                  child: ReusableCard(
                    onTap: selectGender(Gender.male),
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: selectGender(Gender.female),
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kInactiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Text(
                    displayInchesInFeet(selectedHeight),
                    style: kNumberTextStyle,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: kAccentColor,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: kAccentColor.withAlpha(29),
                    ),
                    child: Slider(
                      value: selectedHeight.toDouble(),
                      min: 36,
                      max: 96,
                      onChanged: (double value) {
                        setState(() {
                          selectedHeight = value.toInt();
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
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    child: PlusMinusSelectorContent(
                      label: "WEIGHT",
                      value: selectedWeight,
                      onPlusPressed: () {
                        setState(() {
                          ++selectedWeight;
                        });
                      },
                      onMinusPressed: () {
                        setState(() {
                          --selectedWeight;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    child: PlusMinusSelectorContent(
                      label: "AGE",
                      value: selectedAge,
                      onPlusPressed: () {
                        setState(() {
                          ++selectedAge;
                        });
                      },
                      onMinusPressed: () {
                        setState(() {
                          --selectedAge;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          NavButton(
            text: 'CALCULATE YOUR BMI',
            navigationPage: ResultPage(
              bmi: bmi,
              bmiResult:
                  BMICalculator.getResult(bmi, selectedGender, selectedAge),
              normalRange:
                  BMICalculator.getNormalRange(selectedGender, selectedAge),
            ),
            navigationMethod: Navigator.push,
          ),
        ],
      ),
    );
  }
}
