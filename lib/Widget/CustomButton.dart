import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;

  const CustomButton({this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 14,
        width: 17,
        // color: Colors.,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: Colors.grey)),
        child: Center(
          child: Text(
            name,
            style: TextStyle(fontSize: 10, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
