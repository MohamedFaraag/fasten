import 'package:flutter/material.dart';

class SelectedColor extends StatelessWidget {
  final Function onTap;
  final bool selected;
  final Color s;

  const SelectedColor({this.onTap, this.s, this.selected});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: selected ? Colors.white : s,
              border: Border.all(color: Colors.grey[400]),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: s,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
