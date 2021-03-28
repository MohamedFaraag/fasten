import 'package:flutter/material.dart';
import 'package:fasten/Helpers/images.dart';
import 'package:fasten/Helpers/size_conifg.dart';
import 'package:fasten/Widget/HomeNavigationBar.dart';
import 'package:fasten/Widget/myAppBar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Helpers/images.dart';

import '../Helpers/size_conifg.dart';

import '../Widget/SocialLogin.dart';

class SelectContactWith extends StatelessWidget {
  static String routeName = '/SelectContactWith';
  void launchwhatsapp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunch(url) ? launch(url) : print("Sorry");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(onTap: () {}, name: "Social", iset: false),
      bottomNavigationBar: MyHomeBottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: getProportionateScreenHeight(250),
                    width: getProportionateScreenWidth(375),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.25), BlendMode.dstATop),
                        image: AssetImage(fist),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Container(
                    height: getProportionateScreenHeight(112),
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: ban.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: getProportionateScreenHeight(112),
                            width: getProportionateScreenWidth(112),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                scale: 0.5,
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.white.withOpacity(0.20),
                                    BlendMode.dstATop),
                                image: AssetImage(
                                  ban[index],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Container(
                    height: getProportionateScreenHeight(250),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(40)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.transparent,
                            spreadRadius: 5.0,
                            blurRadius: 0.5,
                            offset: Offset(0.7, 0.7)),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Center(child: Image.asset(woImage)),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Talk to the seller',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(21),
                                ),
                              ),
                              CircleAvatar(
                                radius: getProportionateScreenWidth(30),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(
                                  profileImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Ahmed Hassan Mohamed',
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Riyadh, Saudi Arabia',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(12),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        SocialLogin(
                                          image: Social[0],
                                        ),
                                        Text(
                                          'Chat',
                                          style: TextStyle(
                                            color: Color(0xFFB83B5E),
                                            fontSize:
                                                getProportionateScreenWidth(10),
                                          ),
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        launch('tel://01208860796');
                                      },
                                      child: Column(
                                        children: [
                                          SocialLogin(
                                            image: Social[1],
                                          ),
                                          Text(
                                            'Phone',
                                            style: TextStyle(
                                              color: Color(0xFFFE7680),
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      10),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => launchwhatsapp(
                                          number: '+201151021180',
                                          message: "Hello"),
                                      child: Column(
                                        children: [
                                          SocialLogin(
                                            image: Social[2],
                                          ),
                                          Text(
                                            'WhatsApp',
                                            style: TextStyle(
                                              color: Color(0xFF4CAF50),
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      10),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
