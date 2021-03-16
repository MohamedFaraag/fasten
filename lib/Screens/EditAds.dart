import 'package:flutter/material.dart';

class EditAds extends StatefulWidget {
  static String routeName = '/EditAds';
  @override
  _EditAdsState createState() => _EditAdsState();
}

class _EditAdsState extends State<EditAds> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    int id = routeArg['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text('$id'),
      ),
      body: Column(
        children: [
          Text('$id'),
        ],
      ),
    );
  }
}
