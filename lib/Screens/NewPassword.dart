import 'package:flutter/material.dart';

import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Widget/Buttons.dart';
import 'Home.dart';

// widget.phoneForAPI,widget.firebasePhone
class NewPassword extends StatelessWidget {
  // static String routeName = '/NewPassword';
  final String phoneForAPI;

  const NewPassword(this.phoneForAPI);

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
                      height: getProportionateScreenHeight(20),
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
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(16),
                    ),
                    Button(
                      textButton: 'Change Password',
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Home.routeName);
                        print('change Password');
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
