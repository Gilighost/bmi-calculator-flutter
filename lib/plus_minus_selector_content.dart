import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'constants.dart';

class plusMinusSelectorContent extends StatelessWidget {
  plusMinusSelectorContent({
    @required this.label,
    @required this.value,
    @required this.onPlusPressed,
    @required this.onMinusPressed,
  });

  final String label;
  final int value;
  final Function onPlusPressed;
  final Function onMinusPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: kLabelStyle,
        ),
        Text(
          value.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              iconData: FontAwesomeIcons.minus,
              onPressed: onMinusPressed,
            ),
            SizedBox(
              width: 10,
            ),
            RoundIconButton(
              iconData: FontAwesomeIcons.plus,
              onPressed: onPlusPressed,
            ),
          ],
        ),
      ],
    );
  }
}
