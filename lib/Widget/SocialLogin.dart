import 'package:flutter/material.dart';


class SocialLogin extends StatelessWidget {
  final String image;

  const SocialLogin({this.image});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
      child: Image.asset(image,fit: BoxFit.fill,)
    );
  }
}
