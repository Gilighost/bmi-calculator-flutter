import 'package:flutter/material.dart';
import 'constants.dart';

class NavButton extends StatelessWidget {
  NavButton({
    @required this.text,
    @required this.navigationPage,
    @required this.navigationMethod,
  });

  final String text;
  final Widget navigationPage;
  final Function navigationMethod;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigationMethod(
            context,
            MaterialPageRoute(
              builder: (context) => navigationPage,
            ));
      },
      child: Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kAccentColor,
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}
