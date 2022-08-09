import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPress;

  Button(this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text("Button"),
        onPressed: onPress,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 180, 25, 25))),
      ),
    );
  }
}
