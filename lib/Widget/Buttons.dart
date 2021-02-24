import 'package:flutter/material.dart';

import '../Helpers/constant.dart';

class Button extends StatelessWidget {
  final String textButton;
  final Function onPressed;

  const Button({this.textButton, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: s,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.1, 0.9],
          colors: [
            Color(0xFFFE7680),
            Color(0xFFB83B5E),
          ],
        ),
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          textButton,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
