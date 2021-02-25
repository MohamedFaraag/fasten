import 'package:fasten/Helpers/size_conifg.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class selectedCategory extends StatelessWidget {
  final Color textColor;
  final String name;
  final Function onTap;
  final Color sele;

  const selectedCategory({this.textColor, this.name,this.onTap,this.sele});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: sele,
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
      ),
    );
  }
}
