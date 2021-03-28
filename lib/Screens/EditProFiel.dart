import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/EditProfileModel.dart';

import '../Controllers/EditProfileController.dart';

import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Helpers/Loading.dart';

import '../Screens/Home.dart';

import '../Widget/Buttons.dart';
import '../Widget/myAppBar.dart';

class EditProFile extends StatefulWidget {
  static String routeName = '/EditProfile';

  @override
  _EditProFileState createState() => _EditProFileState();
}

class _EditProFileState extends State<EditProFile> {
  String name;
  String email;
  String phone;
  String password;
  String country;
  String city;
  String nameafter;
  String emailafter;
  String phoneafter;
  String passwordafter;
  String countryafter;
  String cityafter;
  String image;
  bool _loading = false;
  bool _isLoad = false;
  EditProFileController _editProFileController = EditProFileController();
  EditProfileModel _editProfileModel = EditProfileModel();
  void _submitForm(context) async {
    setState(() {
      _loading = true;
    });
    Map<String, dynamic> _result = await _editProFileController.EditProfile(
      name: nameafter == null ? name : nameafter,
      email: emailafter == null ? email : emailafter,
      city: cityafter == null ? city : cityafter,
      phone: phoneafter == null ? phone : phoneafter,
      country: countryafter == null ? country : countryafter,
      password: passwordafter == null ? password : passwordafter,
    );
    if (_result['success'] == true) {
      print('Response Done');
      print(_result);
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    } else {
      print('Response error');
    }

    setState(() {
      _loading = true;
    });
  }

  File _file;
  Future getFile() async {
    File file = await FilePicker.getFile();
    setState(() {
      _file = file;
    });
  }

  void _uploadFile(filePath, BuildContext ctx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoad = true;
    });
    String fileName = basename(filePath.path);
    print("file base name: $fileName");
    try {
      dio.FormData formData = new dio.FormData.fromMap({
        "images": await dio.MultipartFile.fromFile(filePath.path,
                filename: fileName) ??
            image,
      });
      dio.Response response = await dio.Dio().post(
        "https://fostan.demo.asol-tec.com/api/v1/user/update/avatar",
        data: formData,
        options: dio.Options(
          headers: {
            'Authorization': prefs.getString('token'),
          },
        ),
      );
      print("File Upload response:$response");
      print(response.data);
    } catch (e) {
      print("Exiption is :$e");
      setState(() {
        _isLoad = false;
      });
    }
    setState(() {
      _isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    setState(() {
      name = routeArg['name'];
      email = routeArg['email'];
      password = routeArg['password'];
      phone = routeArg['phone'];
      country = routeArg['country'];
      city = routeArg['city'];
      image = routeArg['image']??'';
    });
    print(name);
    return Scaffold(
        appBar: myAppBar(
            onTap: () {
              Navigator.of(context).pop();
            },
            name: '',
            iset: true),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFEFE0E4),
                Color(0xFFEFE0E4),
                Color(0xFFEFE0E4),
              ],
            )),
            height: getProportionateScreenHeight(790),
            width: double.infinity,
            // color: Colors.black,
            padding: EdgeInsets.all(15.0),
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(woImage),
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: getProportionateScreenWidth(30),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.transparent,
                                child: _file == null
                                    ? FadeInImage(placeholder: AssetImage(profileImage),image: NetworkImage(image),)
                                    : Image.file(_file),
                              ),
                              GestureDetector(
                                onTap: getFile,
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                          Text(name),
                          Text(email),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.black,
                                contentPadding: EdgeInsets.all(10),
                                hintText: name,
                                suffixIcon: Icon(Icons.account_circle_rounded),
                              ),
                              onChanged: (val) {
                                nameafter = val;
                              },
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          Text(
                            'E-mail *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.black,
                                contentPadding: EdgeInsets.all(10),
                                hintText: email,
                                suffixIcon: Icon(Icons.mail),
                              ),
                              onChanged: (val2) {
                                emailafter = val2;
                              },
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          Text(
                            'Country *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.black,
                                contentPadding: EdgeInsets.all(10),
                                hintText: country,
                                suffixIcon: Icon(Icons.location_city),
                              ),
                              onChanged: (val3) {
                                countryafter = val3;
                              },
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          Text(
                            'City *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.black,
                                contentPadding: EdgeInsets.all(10),
                                hintText: city,
                                suffixIcon: Icon(Icons.flag),
                              ),
                              onChanged: (val4) {
                                cityafter = val4;
                              },
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          Text(
                            'Password *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              cursorColor: Colors.black,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.black,
                                contentPadding: EdgeInsets.all(10),
                                hintText: '*****',
                                suffixIcon: Icon(Icons.visibility),
                              ),
                              onChanged: (valpas) {
                                passwordafter = valpas;
                              },
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          // Text(
                          //   'Confirm password *',
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold, fontSize: 12),
                          // ),
                          // SizedBox(
                          //   height: getProportionateScreenHeight(10),
                          // ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(5.5),
                          //     color: Colors.white,
                          //   ),
                          //   child: TextFormField(
                          //     keyboardType: TextInputType.phone,
                          //     cursorColor: Colors.black,
                          //     obscureText: true,
                          //     decoration: InputDecoration(
                          //       border: InputBorder.none,
                          //       fillColor: Colors.black,
                          //       contentPadding: EdgeInsets.all(10),
                          //       hintText: '*****',
                          //       suffixIcon: Icon(Icons.visibility),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: getProportionateScreenHeight(20),
                          // ),
                          _loading
                              ? Reusable.showLoader(_loading,
                                  width: getProportionateScreenHeight(50),
                                  height: getProportionateScreenHeight(50))
                              : Button(
                                  textButton: 'Save',
                                  onPressed: () {
                                    _submitForm(context);
                                    _uploadFile(_file, context);
                                    // Navigator.of(context)
                                    //     .pushReplacementNamed(Home.routeName);
                                  },
                                )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        )));
  }
}
