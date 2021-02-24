import 'package:flutter/material.dart';

class CustomTextProfiel extends StatelessWidget {
  final String name;

  const CustomTextProfiel({this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Icon(
          Icons.keyboard_arrow_right,
        ),
      ],
    );
  }
}
