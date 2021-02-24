import 'package:fasten/Helpers/size_conifg.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class selectedCategory extends StatelessWidget {
  final Color textColor;
  final String name;

  const selectedCategory({this.textColor, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.3),
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: getProportionateScreenHeight(29),
      width: getProportionateScreenWidth(100),
      child: Center(
          child: Text(
        name,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: textColor),
      )),
    );
  }
}
