import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'round_icon_button.dart';

const averageFemaleHeight = 63;
const averageMaleHeight = 69;
const averageFemaleWeight = 170;
const averageMaleWeight = 190;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int selectedHeight = averageMaleHeight;
  int selectedWeight = averageMaleWeight;

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
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelStyle,
                          ),
                          Text(
                            selectedWeight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    --selectedWeight;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    ++selectedWeight;
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
                      color: kInactiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: kBottomContainerHeight,
              color: kAccentColor,
              margin: EdgeInsets.only(top: 10),
            )
          ],
        ));
  }
}
