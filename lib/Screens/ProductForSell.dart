import 'package:flutter/material.dart';

import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Widget/CustomButton.dart';
import '../Widget/CustomTextForSearch.dart';
import '../Screens/Home.dart';

class ProductForSell extends StatefulWidget {
  static String routeName = '/ProductForSell';

  @override
  _ProductForSellState createState() => _ProductForSellState();
}

class _ProductForSellState extends State<ProductForSell> {
  bool isSeletcted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: MyHomeBottomNavBar(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Sell',
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Home.routeName);
            },
            child: Image.asset(signout)),
        actions: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.tune),
                Text('225 Adds'),
                Text('Ranking: newest'),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(21),
                      color: Color(0xFFB83B5E)),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextForSearch(
                      onTap: () {
                        setState(() {
                          isSeletcted = !isSeletcted;
                        });
                      },
                      name: 'female',
                      isSeletcted: isSeletcted,
                    ),
                    Text(
                      'female',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'female',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'female',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'female',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'female',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(ProImage.length, (index) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // border: Border.all(color: Color(0xFFB83B5E)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: getProportionateScreenHeight(170),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: getProportionateScreenHeight(150),
                                    width: getProportionateScreenWidth(150),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            ProImage[index],
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(10),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: getProportionateScreenHeight(15),
                                  ),
                                  Text(
                                    'Women shoes',
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(15),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text('Guess tan side zip boots'),
                                  Text('women'),
                                  Text('1000 \$'),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height:
                                              getProportionateScreenWidth(12),
                                          width:
                                              getProportionateScreenHeight(12),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Container(
                                              height:
                                                  getProportionateScreenHeight(
                                                      3),
                                              width:
                                                  getProportionateScreenWidth(
                                                      3),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomButton(
                                        name: 'XXl',
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenHeight(5),
                                      ),
                                      CustomButton(name: 'Xl'),
                                      SizedBox(
                                        width: getProportionateScreenHeight(5),
                                      ),
                                      CustomButton(name: 'L'),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(sale),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSeletcted = !isSeletcted;
                                  });
                                },
                                child: Icon(
                                  Icons.favorite,
                                  size: 20,
                                  color: isSeletcted ? Colors.red : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// Container(
// height: getProportionateScreenHeight(815),
// width: double.infinity,
// child: ListView.builder(itemBuilder: (context, index) {
// return Card();
// }),
// )
