import 'package:flutter/material.dart';

import '../Helpers/images.dart';

myAppBar({Function onTap, String name, bool iset}) {
  return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: iset
              ? Icon(
                  Icons.search,
                  color: Colors.black,
                )
              : null,
        ),
      ],
      backgroundColor: Colors.grey[200],
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        name,
        style: TextStyle(color: Colors.black),
      ),
      leading: iset
          ? GestureDetector(onTap: onTap, child: Image.asset(signout))
          : null);
}
