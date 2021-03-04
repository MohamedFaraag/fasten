import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../Providers/google_sgin_in.dart';
import '../Screens/Home.dart';
import '../Screens/ForgetPassword.dart';
import '../Screens/SingUp.dart';
import '../Widget/Buttons.dart';
import '../Widget/SocialLogin.dart';
import '../Helpers/size_conifg.dart';
import '../Helpers/images.dart';
import '../Helpers/Loading.dart';
import '../Controllers/LoginController.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  static String routeName = '/Login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  GoogleAuthLogin googleAuthLogin = GoogleAuthLogin();

  String name = '', image;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginController _loginController = LoginController();
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  ///Varablie For Auth
  var _phone;
  var _password;

  ///Var For Loading
  bool _loading = false;

  ///Var For error
  String errPhone;
  String errPassword;
  @override
  @override
  void dispose() {
    super.dispose();
    _submitForm();
  }

  ///Function For Auth
  void _submitForm() async {
    setState(() {
      _loading = true;
    });
    Map<String, dynamic> _result =
        await _loginController.userLogin(phone: _phone, password: _password);
    if (_result['success']) {
      print('Response Done');
      print(_result);
      if (_result['result'] == "admin") {
        print('Your are Admin');

        if (mounted) {
          setState(() {
            _loading = false;
          });
          Navigator.of(context).pushReplacementNamed(Home.routeName);
        }
      } else {
        print('Your are User');
        setState(() {
          _loading = false;
        });
      }
    } else {
      print('Response error');
      print("Result is ${_result['errPhone']}");
      print("Result is ${_result['errPassword']}");
      setState(() {
        errPhone = _result['errPhone'];
        errPassword = _result['errPassword'];
        _loading = false;
      });
      print(_result['success']);
    }
    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(woImage),
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: getProportionateScreenHeight(200),
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            image: DecorationImage(
                              image: AssetImage(welcomeImage),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(fontSize: 21),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(31.5),
                              ),
                              Text('Mobile number'),
                              SizedBox(
                                height: getProportionateScreenHeight(5.5),
                              ),

                              ///For PhoneNumber
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
                                      print(phone
                                          .completeNumber); //get complete number
                                      print(phone
                                          .countryCode); // get country code only
                                      print(phone.number); // only phone number
                                      setState(() {
                                        _phone = phone.number;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                "${errPhone ?? ''}",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(14),
                                    color: Colors.red),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(5.5),
                              ),
                              Text('Password'),
                              SizedBox(
                                height: getProportionateScreenHeight(5.5),
                              ),

                              ///For Password
                              Container(
                                color: Colors.white,
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      _password = value;
                                    });
                                  },
                                  keyboardType: TextInputType.phone,
                                  cursorColor: Colors.black,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // fillColor: Colors.black,
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: '*****',
                                    suffixIcon: Icon(Icons.visibility),
                                  ),
                                ),
                              ),
                              Text(
                                "${errPassword ?? ''}",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(14),
                                    color: Colors.red),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              _loading
                                  ? Reusable.showLoader(_loading,
                                      width: getProportionateScreenHeight(50),
                                      height: getProportionateScreenHeight(50))
                                  : Button(
                                      textButton: 'Login',
                                      onPressed: () {
                                        print('Login');
                                        _submitForm();
                                        print('--------------');
                                        print('Login Info');
                                        print('--------------');
                                        print("Login PHone $_phone");
                                        print("Login Password$_password");

                                        // Navigator.of(context)
                                        //     .pushReplacementNamed(Home.routeName);
                                      },
                                    ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(ForgetPassword.routeName);
                          },
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF777777)),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Or log in with',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF333333)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //                        final FacebookLoginResult result =
                                //                            await facebookSignIn.logIn(['email']);
                                //
                                //                        switch (result.status) {
                                //                          case FacebookLoginStatus.loggedIn:
                                //                            final FacebookAccessToken accessToken =
                                //                                result.accessToken;
                                //                            final graphResponse = await http.get(
                                //                                'https://graph.facebook.com/v2.12/me?fields=first_name,picture&access_token=${accessToken.token}');
                                //                            final profile =
                                //                                jsonDecode(graphResponse.body);
                                //                            print(profile);
                                //                            setState(() {
                                //                              name = profile['first_name'];
                                //                              image = profile['picture']['data']['url'];
                                //                            });
                                //                            print('''
                                // Logged in!
                                //
                                // Token: ${accessToken.token}
                                // User id: ${accessToken.userId}
                                // Expires: ${accessToken.expires}
                                // Permissions: ${accessToken.permissions}
                                // Declined permissions: ${accessToken.declinedPermissions}
                                // ''');
                                //                            break;
                                //                          case FacebookLoginStatus.cancelledByUser:
                                //                            print('Login cancelled by the user.');
                                //                            break;
                                //                          case FacebookLoginStatus.error:
                                //                            print(
                                //                                'Something went wrong with the login process.\n'
                                //                                'Here\'s the error Facebook gave us: ${result.errorMessage}');
                                //                            break;
                                //                        }
                              },
                              child: SocialLogin(
                                image: facebookImage,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await googleAuthLogin.googleSignIn();
                              },
                              child: SocialLogin(
                                image: gmailImage,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await _signOut();
                              },
                              child: SocialLogin(
                                image: twiterImage,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(Home.routeName);
                              },
                              child: Text(
                                'Log in as a visitor',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFF333333)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('I have not account');
                                Navigator.of(context)
                                    .pushReplacementNamed(SingUp.routeName);
                              },
                              child: Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  color: Color(0xFFB83B5E),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
