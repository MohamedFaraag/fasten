import 'package:flutter/material.dart';

class Reusable {
  static Widget showLoader(bool _load,
      {double width = double.infinity, double height = double.infinity}) {
    Widget loadingIndicator = _load
        ? Center(
          child: new Container(

              color: Colors.transparent,
              width: width,
              height: height,
              child: new Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: new Center(
                      child: new CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFCB4B67)),
                  ))),
            ),
        )
        : new Container();

    return loadingIndicator;
  }
}
