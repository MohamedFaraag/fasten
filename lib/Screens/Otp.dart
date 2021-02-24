import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../Screens/Home.dart';
import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Widget/Buttons.dart';
import '../Screens/NewPassword.dart';

class OTP extends StatefulWidget {
  final String firebasePhone;
  final String phoneForAPI;

  OTP(this.firebasePhone, this.phoneForAPI);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  var x;
  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(x ?? "OTPText");
    return Scaffold(
      key: _scaffoldkey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: getProportionateScreenHeight(810),
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
                      Text(
                        'Mobile verification',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\nThe verification code was sent in a text message to the mobile that you entered is ',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '${x ?? 'xxxxx'}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFB83B5E)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //which is \n${x ?? 'xxxxx'}
                      Center(child: Text('verification code')),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: OTPTextField(
                          length: 6,
                          width: MediaQuery.of(context).size.width,
                          fieldStyle: FieldStyle.underline,
                          onCompleted: (pin) async {
                            print(pin);
                            x = pin;

                            try {
                              await FirebaseAuth.instance
                                  .signInWithCredential(
                                      PhoneAuthProvider.credential(
                                          verificationId: _verificationCode,
                                          smsCode: pin))
                                  .then((value) async {
                                if (value.user != null) {
                                  print('OTP DONE');
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewPassword(widget.phoneForAPI)),
                                      (route) => false);
                                }
                              });
                            } catch (e) {
                              FocusScope.of(context).unfocus();
                              _scaffoldkey.currentState.showSnackBar(
                                  SnackBar(content: Text("Error")));
                            }
                          },
                        ),
                      ),

                      Button(
                        onPressed: () async {
                          print('next');

                          try {
                            await FirebaseAuth.instance
                                .signInWithCredential(
                                    PhoneAuthProvider.credential(
                                        verificationId: _verificationCode,
                                        smsCode: x))
                                .then((value) async {
                              if (value.user != null) {
                                print('OTP DONE');
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NewPassword(widget.phoneForAPI)),
                                    (route) => false);
                              }
                            });
                          } catch (e) {
                            FocusScope.of(context).unfocus();
                            _scaffoldkey.currentState
                                .showSnackBar(SnackBar(content: Text("Error")));
                          }
                        },
                        textButton: 'Confirmation',
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      Center(
                        child: Text(
                          'Didn\'t receive a text message?',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Color(0xFFB83B5E), width: 2),
                          color: Colors.white,
                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          elevation: 0.0,
                          color: Color(0xFFEFE0E4),
                          onPressed: () {
                            print('Send again');
                            _verifyPhone();
                          },
                          child: Text(
                            'Resend verification code',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFFB83B5E)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.firebasePhone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print('DONE USER');
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPassword(widget.phoneForAPI),
                  ),
                  (route) => false);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            } else {
              print('FAILED USER');
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 60));
  }
}
