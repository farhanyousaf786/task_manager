import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  OptionButton({@required this.onPressed, this.title});

  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
