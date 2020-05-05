import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({@required this.color, this.child, this.onTap});

  final Color color;
  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
