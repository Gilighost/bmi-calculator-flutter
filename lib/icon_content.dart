import 'package:flutter/material.dart';

const double iconSize = 80;
const double sizedBoxHeight = 15;
const Color labelColor = Colors.grey;
const double labelTextSize = 18;

class IconContent extends StatelessWidget {
  const IconContent({@required this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          label,
          style: TextStyle(
            color: labelColor,
            fontSize: labelTextSize,
          ),
        ),
      ],
    );
  }
}
