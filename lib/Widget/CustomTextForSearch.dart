import 'package:flutter/material.dart';

class CustomTextForSearch extends StatelessWidget {
  Function onTap;
  final String name;
  bool isSeletcted;
  CustomTextForSearch({this.name, this.onTap, this.isSeletcted});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        name,
        style: TextStyle(
            fontSize: 15,
            decoration:
                isSeletcted ? TextDecoration.underline : TextDecoration.none,
            fontWeight: FontWeight.w400,
            color: isSeletcted ? Color(0xFFB83B5E) : Colors.black),
      ),
    );
  }
}
