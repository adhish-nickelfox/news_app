import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String headingText;

  Heading(this.headingText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 15),
      child: Text(
        headingText,
        style: TextStyle(
            color: Colors.lightBlue, fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
