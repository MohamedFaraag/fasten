import 'package:fasten/Helpers/size_conifg.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class selectedCategory extends StatelessWidget {
  final bool selected;
  final List<Color> co2;
  final List<Color> co1;
  final String name;

  const selectedCategory({this.selected, this.co2, this.co1, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: selected ? Colors.grey : Colors.transparent, width: 1.3),
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: selected ? co2 : co1)),
      height: getProportionateScreenHeight(29),
      width: getProportionateScreenWidth(88.33),
      child: Center(
          child: Text(
        name,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      )),
    );
  }
}
