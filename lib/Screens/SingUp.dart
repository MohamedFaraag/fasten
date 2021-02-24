import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Screens/Otp.dart';
import '../Widget/Buttons.dart';

class SingUp extends StatelessWidget {
  static String routeName = '/SingUp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      // ),
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
                      'Mobile verification',
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000)),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      'We will send a text SMS to verify your number',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000)),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Text(
                      'Mobile number',
                      style: TextStyle(),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          // border: Border.all(color: Colors.white),
                        ),
                        child: IntlPhoneField(
                          decoration: InputDecoration(

                              //decoration for Input Field
                              labelText: 'Phone Number',
                              border: InputBorder.none
                              // border: OutlineInputBorder(
                              //   // borderSide: BorderSide(),
                              // ),
                              ),
                          initialCountryCode:
                              'EG', //default contry code, NP for Nepal
                          onChanged: (phone) {
                            //when phone number country code is changed
                            print(phone.completeNumber); //get complete number
                            print(phone.countryCode); // get country code only
                            print(phone.number); // only phone number
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(16),
                    ),
                    Button(
                      textButton: 'Next',
                      onPressed: () {
                        print('Next');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OTP('',""),
                          ),
                        );
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
