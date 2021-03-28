import '../Helpers/constant.dart';
import '../Helpers/size_conifg.dart';
import 'package:flutter/material.dart';

class SelectCategory extends StatelessWidget {
  final String image;

  const SelectCategory({this.image});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: getProportionateScreenWidth(40),
        foregroundColor: Colors.white,
        backgroundColor: s,
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ));
  }
}
