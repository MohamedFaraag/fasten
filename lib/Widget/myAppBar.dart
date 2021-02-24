import 'package:flutter/material.dart';

import '../Helpers/images.dart';

myAppBar({Function onTap, String name}) {
  return AppBar(

      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            Icons.search,
            color: Colors.black,
          ),
        )
      ],
      backgroundColor: Colors.grey[200],
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        name,
        style: TextStyle(color: Colors.black),
      ),
      leading: GestureDetector(onTap: onTap, child: Image.asset(signout)));
}
