import 'package:fasten/Widget/myAppBar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/myAdds.dart';
import '../Controllers/UsersController.dart';
import '../Models/UsersModel.dart';
import '../Screens/EditProFiel.dart';
import '../Screens/Login.dart';
import '../Widget/HomeNavigationBar.dart';
import '../Widget/ProfileText.dart';
import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Screens/Settings.dart';

class ProFile extends StatefulWidget {
  static String routeName = '/Profile';

  @override
  _ProFileState createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> {
  // final _auth = FirebaseAuth.instance;
  // Future<void> logout() => _auth.signOut();
  UsersModel _usersModel = UsersModel();
  UsersController _usersController = UsersController();
  bool _isLoading = false;
  String _token;
  String name;
  String email;
  String avatar;
  String phone;
  String country;
  String city;

  @override
  void initState() {
    _getToken();
    // _getUsers();
    super.initState();
  }

  // _getUsers() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   _usersModel = await _usersController.getUsers();
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // print('Token in ProFile is $_token');
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: MyHomeBottomNavBar(),
      appBar: myAppBar(iset: false, name: 'My Account', onTap: () {}),
      body: _isLoading != null
          ? Container(
              child: _token != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xFFB83B5E),
                                Color(0xFFFE7680),
                              ],
                            ),
                          ),
                          width: double.infinity,
                          height: getProportionateScreenHeight(100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          EditProFile.routeName,
                                          arguments: {
                                            'name': name??'',
                                            'email': email??'',
                                            'phone': phone??'',
                                            'country': country ?? '',
                                            'city': city ?? '',
                                            'image': avatar ?? ''
                                          });
                                    },
                                    child: Text('Edit')),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(name.toString()),
                                  Text(email.toString()),
                                ],
                              ),
                              CircleAvatar(
                                  radius: getProportionateScreenWidth(30),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.transparent,
                                  child: FadeInImage(
                                    // here `bytes` is a Uint8List containing the bytes for the in-memory image
                                    placeholder: AssetImage(profileImage),
                                    image: NetworkImage(avatar),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          height: getProportionateScreenHeight(140),
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MyAdds.routeName);
                                },
                                child: CustomTextProfiel(
                                  name: 'Advertisement',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Settings.routeName);
                                },
                                child: CustomTextProfiel(
                                  name: 'Settings',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  SharedPreferences.getInstance().then(
                                    (value) => value.clear(),
                                  );
                                  Navigator.pushReplacementNamed(
                                      context, Login.routeName);
                                  // logout();
                                },
                                child: CustomTextProfiel(
                                  name: 'Sign out',
                                ),
                              )
                            ],
                          ),
                        ),

                        // SizedBox(
                        //   height: getProportionateScreenHeight(100),
                        // ),
                        Center(
                          child: Column(
                            children: [
                              Container(
                                height: getProportionateScreenHeight(50),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(set),
                                  ),
                                ),
                              ),
                              Text(
                                'Designed and implemented by Osoul Tech',
                                style: TextStyle(
                                  color: Color(0xFF777777),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Login.routeName);
                        },
                        child: Text(
                          'Please Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
            )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            ),
    );
  }

  _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
      name = prefs.getString('name');
      avatar = prefs.getString('avatar');
      email = prefs.getString('email');
      phone = prefs.getString('phone');
      country = prefs.getString('country');
      city = prefs.getString('city');
    });
  }
}
