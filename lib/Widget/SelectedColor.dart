import 'package:flutter/material.dart';

class SelectedColor extends StatelessWidget {
  final Function onTap;

  final Color s;
  final Color set;

  const SelectedColor({this.onTap, this.s, this.set});
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
              color: set,
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
