import 'package:flutter/material.dart';

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
  var country;
  var city;
  String nameafter;
  String emailafter;
  String phoneafter;
  String passwordafter;
  var countryafter;
  var cityafter;
  bool _loading = false;
  EditProFileController _editProFileController = EditProFileController();
  EditProfileModel _editProfileModel = EditProfileModel();
  void _submitForm() async {
    setState(() {
      _loading = true;
    });
    Map<String, dynamic> _result = await _editProFileController.EditProfile(
      name: nameafter == null ? name : nameafter,
      email: emailafter == null ? email : emailafter,
      city: cityafter == null ? city : cityafter,
      phone: phoneafter == null ? phone : phoneafter,
      country: countryafter == null ? country : countryafter,
      password: password,
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
                          CircleAvatar(
                            radius: getProportionateScreenWidth(30),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              profileImage,
                              fit: BoxFit.cover,
                            ),
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
                                    _submitForm();
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
