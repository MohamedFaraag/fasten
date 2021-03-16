import 'dart:io';

import 'package:fasten/Helpers/images.dart';
import 'package:fasten/Helpers/size_conifg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Requset extends StatefulWidget {
  @override
  _RequsetState createState() => _RequsetState();
}

class _RequsetState extends State<Requset> {
  bool _isLoad = false;
  File _file;
  Future getFile() async {
    File file = await FilePicker.getFile();
    setState(() {
      _file = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: getFile,
      child: Container(
        height: getProportionateScreenHeight(90),
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          image: DecorationImage(
              image: _file == null ? AssetImage(gallery) : FileImage(_file),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        // child: _image == null
        //     ? Image.asset('assets/images/addimg.png')
        //     : FileImage(_image),
      ),
    );
  }
}
