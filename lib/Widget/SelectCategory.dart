import 'package:fasten/Helpers/constant.dart';
import 'package:flutter/material.dart';

class SelectCategory extends StatelessWidget {
  final String image;

  const SelectCategory({this.image});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 55,
        foregroundColor: Colors.white,
        backgroundColor: s,
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ));
  }
}
