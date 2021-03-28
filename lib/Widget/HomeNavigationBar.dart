import 'package:flutter/material.dart';

import '../Helpers/size_conifg.dart';
import '../localization/supportedLanguage.dart';
import '../Screens/SelectContactWith.dart';
import '../Screens/favorite.dart';
import '../Screens/Home.dart';
import '../Screens/Profile.dart';

// ignore: must_be_immutable
class MyHomeBottomNavBar extends StatefulWidget {
  @override
  _MyHomeBottomNavBarState createState() => _MyHomeBottomNavBarState();
}

class _MyHomeBottomNavBarState extends State<MyHomeBottomNavBar> {
  int id;
  bool set = false;

  List<Color> co1 = [
    Color(0xFFFE7680),
    Color(0xFFB83B5E),
  ];

  List<Color> co2 = [
    Colors.white,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(75),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 20, color: Colors.grey[300], spreadRadius: 1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(ConstData.datalist().length, (index) {
            id = ConstData.datalist()[index].id ?? 3;
            return GestureDetector(
              onTap: () {
                setState(() {
                  id = ConstData.datalist()[index].id;
                });
                print(id);
                print(id);
                switch (id) {
                  case 1:
                    print('ID 1 Nav To Acc');

                    Navigator.pushReplacementNamed(context, ProFile.routeName);
                    break;
                  case 2:
                    print("ID 2 Nav To Notfication");
                    break;
                  case 3:
                    print("ID 3 Nav To Home");

                    Navigator.pushReplacementNamed(context, Home.routeName);

                    break;
                  case 4:
                    print("ID 4 Nav To Chat");
                    Navigator.pushReplacementNamed(context, Favorite.routeName);
                    break;
                  case 5:
                    print("ID 5 Nav To Not");

                    Navigator.pushReplacementNamed(
                        context, SelectContactWith.routeName);
                    break;
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: id != ConstData.datalist()[index].id ? co1 : co2),
                  // color: isSelected ? Color(0xFFEB5982) : Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: id != ConstData.datalist()[index].id
                      ? [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              spreadRadius: 1)
                        ]
                      : [],
                ),
                height: getProportionateScreenHeight(56),
                width: getProportionateScreenWidth(70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(ConstData.datalist()[index].icon,
                        color: id != ConstData.datalist()[index].id
                            ? Colors.white
                            : Colors.grey),
                    Text(
                      ConstData.datalist()[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(12),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
        // onTap: () {
        //   print(ConstData.datalist()[index].id);
        //   setState(() {
        //     id = ConstData.datalist()[index].id;
        //   });
        // },
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     GestureDetector(
        //       onTap: () {
        //         Navigator.pushReplacementNamed(context, ProFile.routeName);
        //       },
        //       child: buildContainerBottomNav(
        //           Icons.person_outline_outlined, 'Account'),
        //     ),
        //     buildContainerBottomNav(
        //         Icons.notifications_none_sharp, 'Notfication'),
        //     GestureDetector(
        //       onTap: () {
        //         Navigator.pushReplacementNamed(context, Home.routeName);
        //       },
        //       child:
        //           buildContainerBottomNav(Icons.home, 'Home', isSelected: true),
        //     ),
        //     GestureDetector(
        //         onTap: () {
        //           Navigator.pushReplacementNamed(context, Favorite.routeName);
        //         },
        //         child: buildContainerBottomNav(Icons.favorite_outline, 'Wish')),
        //     GestureDetector(
        //         onTap: () {
        //           Navigator.pushReplacementNamed(
        //               context, SelectContactWith.routeName);
        //         },
        //         child:
        //             buildContainerBottomNav(Icons.chat_bubble_outline, 'Chat')),
        //   ],
        // ),
      ),
    );
  }

// Container buildContainerBottomNav(IconData icon, name, {isSelected = false}) {
//   return Container(
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//           begin: Alignment.topRight,
//           end: Alignment.bottomLeft,
//           colors: isSelected ? co1 : co2),
//       // color: isSelected ? Color(0xFFEB5982) : Colors.white,
//       shape: BoxShape.circle,
//       boxShadow: isSelected
//           ? [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 1)]
//           : [],
//     ),
//     height: getProportionateScreenHeight(56),
//     width: getProportionateScreenWidth(70),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Icon(icon, color: isSelected ? Colors.white : Colors.grey),
//         Text(
//           name,
//           style: TextStyle(
//               color: Colors.black, fontSize: getProportionateScreenWidth(12)),
//         )
//       ],
//     ),
//   );
// }
}
