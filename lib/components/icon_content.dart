import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableColumn extends StatelessWidget {
  ReusableColumn({@required this.icon, @required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 32.0),
        SizedBox(height: 10.0),
        Text(text,style: textStyle)
      ],
    );
  }
}