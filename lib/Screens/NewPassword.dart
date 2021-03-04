import 'package:fasten/Controllers/NewPasswordController.dart';
import 'package:fasten/Helpers/Loading.dart';
import 'package:fasten/Models/NewPasswordModel.dart';
import 'package:flutter/material.dart';

import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Widget/Buttons.dart';
import '../Screens/Home.dart';

// widget.phoneForAPI,widget.firebasePhone
class NewPassword extends StatefulWidget {
  // static String routeName = '/NewPassword';
  final String phoneForAPI;
  final int code;

  const NewPassword(this.phoneForAPI, this.code);

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  String _newPassword;
  String confPassword;
  bool _load = false;
  String errorMassage = "";
  NewPasswordController _newPasswordController = NewPasswordController();

  _changePassword() async {
    setState(() {
      _load = true;
    });
    Map<String, dynamic> _result = await _newPasswordController.changePassword(
      phone: widget.phoneForAPI,
      code: widget.code,
      newPassword: _newPassword,
    );
    if (_newPassword == confPassword) {
      print('Match');
      if (_result["success"]) {
        print('Response Done');
        print(_result);
      } else {
        print('error');
      }
    } else {
      setState(() {
        errorMassage = 'Password doesn\'t match';
      });
      print('Donot match');
    }
    setState(() {
      _load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
          padding: EdgeInsets.all(15.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(woImage),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      'Create a new password',
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000)),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Text(
                      'Choose a strong password',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000)),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Text(
                      'Password *',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
                        onChanged: (val) {
                          _newPassword = val;
                        },
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
                    Text(
                      errorMassage,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      'Confirm Password *',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
                        onChanged: (vla) {
                          confPassword = vla;
                        },
                      ),
                    ),
                    Text(
                      errorMassage,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    _load
                        ? Reusable.showLoader(_load,
                            width: getProportionateScreenWidth(100),
                            height: getProportionateScreenHeight(100))
                        : Button(
                            textButton: 'Change Password',
                            onPressed: () {
                              _changePassword();
                              // Navigator.of(context)
                              //     .pushReplacementNamed(Home.routeName);
                              print('change Password');
                              print('Data To change Password');
                              print('----------------');
                              print('Phone is ${widget.phoneForAPI}');
                              print('Code is ${widget.code}');
                              print('NewPassword $_newPassword');
                              // print(code);
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
