import 'package:flutter/material.dart';

class TestCat extends StatelessWidget {
  final String image;

  const TestCat({this.image});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 55,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ));
  }
}
