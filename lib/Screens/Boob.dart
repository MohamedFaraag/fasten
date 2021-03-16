import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/constant.dart';
import '../Helpers/size_conifg.dart';
import '../Models/BoobModels.dart';
import '../Screens/Login.dart';
import '../Screens/Home.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Boob extends StatefulWidget {
  static String routeName = '/Boob';

  @override
  _BoobState createState() => _BoobState();
}

class _BoobState extends State<Boob> {
  String _token;
  PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    _getToke();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<BoobData> myData = [
      BoobData(
        image: 'assets/images/boob1.png',
        button: 'Next',
        buttonText: 'Skip',
        desc:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
        text: 'Fasten Applicatrion',
      ),
      BoobData(
        image: 'assets/images/boob1.png',
        button: 'Next',
        buttonText: 'Skip',
        desc:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
        text: 'Favourite List',
      ),
      BoobData(
        image: 'assets/images/boob1.png',
        button: 'Next',
        buttonText: 'Skip',
        desc:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
        text: 'Orders List',
      ),
    ];
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(15.0),
          child: PageView.builder(
              controller: _pageController,
              itemCount: myData.length,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(30),
                    ),
                    Container(
                      height: getProportionateScreenHeight(286.61),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(myData[index].image),
                        ),
                      ),
                    ),
                    Text(
                      myData[index].text,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(21),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(myData[index].desc),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: getProportionateScreenHeight(48),
                            width: getProportionateScreenWidth(120),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: s,
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                stops: [0.1, 0.9],
                                colors: [
                                  Color(0xFFFE7680),
                                  Color(0xFFB83B5E),
                                ],
                              ),
                            ),
                            child: FlatButton(
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: Duration(milliseconds: 150),
                                    curve: Curves.bounceInOut);
                                print(index);
                                print('Done');
                              },
                              child: Text(
                                myData[index].button,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _token==null ? Navigator.of(context)
                                  .pushReplacementNamed(Login.routeName):Navigator.of(context)
                                  .pushReplacementNamed(Home.routeName);
                            },
                            child: Text(
                              myData[index].buttonText,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              })),
    );
  }

  Future _getToke() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
      print(_token);
    });
  }
}
