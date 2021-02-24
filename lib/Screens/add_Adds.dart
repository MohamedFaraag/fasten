import 'package:fasten/Controllers/AllCategoryController.dart';
import 'package:fasten/Models/AllCategoryModel.dart';
import 'package:flutter/material.dart';

import '../Helpers/constant.dart';
import '../Helpers/size_conifg.dart';
import '../Screens/myAdds.dart';

import '../Widget/SelectedColor.dart';
import '../Widget/seletCategory.dart';

import '../Helpers/images.dart';
import 'Home.dart';

class AddAdds extends StatefulWidget {
  static String routeName = '/AddAdds';

  @override
  _AddAddsState createState() => _AddAddsState();
}

class _AddAddsState extends State<AddAdds> {
  AllCategoryModel _allCategoryModel = AllCategoryModel();
  AllCategoryController _allCategoryController = AllCategoryController();
  _getData() async {
    _allCategoryModel = await _allCategoryController.getAllCategory();
    setState(() {});
  }

  @override
  initState() {
    _getData();
    // super.initState();
  }

  Color s = Color(0xFFFE7680);
  Color s2 = Color(0xFFB83B5E);
  List<Color> co1 = [
    Color(0xFFFE7680),
    Color(0xFFB83B5E),
  ];
  List<Color> co2 = [
    Colors.white,
    Colors.white,
  ];
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          'Add advertisement',
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
            onTap: () {
              print('SignOut');
              print(_allCategoryModel.message);
              // Navigator.of(context).pushReplacementNamed(Home.routeName);
            },
            child: Image.asset(signout)),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: getProportionateScreenHeight(810),
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Advertising photos'),
                Image.asset(gallery),
                Text('Advertising video'),
                Image.asset(vid),
                Text(
                  'Choose the category',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: getProportionateScreenWidth(14),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                  height: getProportionateScreenHeight(151),
                  width: double.infinity,
                  child: GridView.builder(
                    itemCount: _allCategoryModel.data.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 120,
                        childAspectRatio: 4.5 / 1,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return selectedCategory(
                        co1: co1,
                        co2: co2,
                        selected: selected,
                        name: _allCategoryModel.data[index].name,
                      );
                    },
                  ),
                ),
                Text(
                  'Ad details',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                Text(
                  'product name : ',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(3),
                ),
                Text(
                  'price : ',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(3),
                ),
                Text(
                  'Select the address : ',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Text(
                  'Type',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                            print(selected);
                          });
                        },
                        child: selectedCategory(
                          co1: co1,
                          co2: co2,
                          selected: selected,
                          name: 'Woman',
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                            print(selected);
                          });
                        },
                        child: selectedCategory(
                          co1: co1,
                          co2: co2,
                          selected: selected,
                          name: 'Men',
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                            print(selected);
                          });
                        },
                        child: selectedCategory(
                          co1: co1,
                          co2: co2,
                          selected: selected,
                          name: 'Children',
                        )),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Text('Sizes'),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                            print(selected);
                          });
                        },
                        child: selectedCategory(
                          co1: co1,
                          co2: co2,
                          selected: selected,
                          name: 'Woman',
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                            print(selected);
                          });
                        },
                        child: selectedCategory(
                          co1: co1,
                          co2: co2,
                          selected: selected,
                          name: 'Men',
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                            print(selected);
                          });
                        },
                        child: selectedCategory(
                          co1: co1,
                          co2: co2,
                          selected: selected,
                          name: 'Children',
                        )),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Text('Colors'),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(testColor.length, (index) {
                        return SelectedColor(
                          selected: selected,
                          onTap: () {
                            setState(() {
                              selected = !selected;

                              print(selected);
                            });
                          },
                          s: testColor[index],
                        );
                      })),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Center(
                  child: Container(
                    width: 340,
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
                        Navigator.of(context)
                            .pushReplacementNamed(MyAdds.routeName);
                      },
                      child: Text(
                        'Add advertisement',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

///TestWidget
// Row(
// children: [
// Stack(
// children: [
// CircleAvatar(
// backgroundColor: Colors.green,
// ),
// Container(
// height: 20,
// width: 20,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(30),
// topLeft: Radius.circular(30))),
// ),
// ],
// )
// ],
// )
