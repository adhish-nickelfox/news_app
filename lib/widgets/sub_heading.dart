import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  final String subHeadingText;

  SubHeading(this.subHeadingText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      child: Text(
        subHeadingText,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
