import 'package:flutter/material.dart';

import '../Screens/add_Adds.dart';
import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';

buildAppBAr(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(90.0),
    child: AppBar(
      backgroundColor: Color(0xFFEEEEEE),
      elevation: 0.0,
      automaticallyImplyLeading: false,
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: getProportionateScreenWidth(130),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.1, 0.9],
                  colors: [
                    Color(0xFFFE7680),
                    Color(0xFFB83B5E),
                  ],
                ),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AddAdds.routeName);
                },
                child: Text(
                  'Add adds',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(welcomeImage),
                )),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
