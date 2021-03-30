import 'package:flutter/material.dart';

import '../Controllers/RegesterController.dart';
import '../Controllers/AllCitiesCountroller.dart';
import '../Controllers/AllCountriesController.dart';

import '../Models/RegesterModel.dart';
import '../Models/AllCountriesModel.dart';
import '../Models/AllCitiesModel.dart';

import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Helpers/Loading.dart';

import '../Widget/Buttons.dart';

import '../Screens/Home.dart';

class Regeister extends StatefulWidget {
  static String routeName = '/regiester';

  @override
  _RegeisterState createState() => _RegeisterState();
}

class _RegeisterState extends State<Regeister> {
  var _formKey = GlobalKey<FormState>();
  ReGController _reGController = ReGController();
  RegiesterModel _regiesterModel = RegiesterModel();
  AllCountriesModel _allCountriesModel = AllCountriesModel();
  AllCitiesModel _allCitiesModel = AllCitiesModel();
  AllCitiesController _allCitiesController = AllCitiesController();
  AllCountriesController _allCountriesController = AllCountriesController();
  String message = '';
  bool _isloading = false;
  bool _loadmore = false;
  bool _loading = false;
  bool _lo = false;

  ///Var For ReGister
  String _name;
  String _email;
  String _password;
  String _phone;
  String _myCity;
  String _myCountry;
  String _confPassword;

  void initState() {
    super.initState();
    _getAllCountries();
  }

  _getAllCountries() async {
    setState(() {
      _isloading = true;
    });
    _allCountriesModel = await _allCountriesController.getAllCountries();

    setState(() {
      _isloading = false;
    });
  }

  _getAllCities(String countriesId) async {
    setState(() {
      _loadmore = true;
    });
    _allCitiesModel = await _allCitiesController.getAllcities(countriesId);
    setState(() {
      _loadmore = false;
    });
  }

  void _submitForm() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      setState(() {
        _lo = true;
      });
      _formKey.currentState.save();

      Map<String, dynamic> _result = await _reGController.userReg(
        name: _name,
        email: _email,
        password: _password,
        phone: _phone,
        country_id: _myCountry,
        city_id: _myCity,
      );
      if (_result['success'] == true) {
        print('Response Done');
        print(_result);
         Navigator.of(context).pushReplacementNamed(Home.routeName);
      } else {
        print('Response error');
        message = 'Email OR PASSWORD IS USED';
        print(_result['success']);
        print(message);
      }

      setState(() {
        _lo = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
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

        width: double.infinity,
        // color: Colors.black,
        padding: EdgeInsets.all(15.0),
        child: !_isloading
            ? Form(
                key: _formKey,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(woImage),
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New account',
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(5.5),
                              ),
                              Text(
                                'Add your account data',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(31.5),
                              ),
                              Text(
                                'Name *',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
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
                                  onChanged: (valeu) {
                                    setState(() {
                                      _name = valeu;
                                    });
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'ENTER NAME';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.black,
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: 'name',
                                    suffixIcon:
                                        Icon(Icons.account_circle_rounded),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              Text(
                                'E-mail *',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
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
                                  validator: (vv) {
                                    if (vv.isEmpty && !vv.contains('@')) {
                                      return 'INVALID EMAIL';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.black,
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: 'ex@email',
                                    suffixIcon: Icon(Icons.mail),
                                  ),
                                  onChanged: (valeu) {
                                    setState(() {
                                      _email = valeu;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              Text(
                                'Phone *',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
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
                                  onChanged: (valeu) {
                                    setState(() {
                                      _phone = valeu;
                                    });
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'ENTER PHONE';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.phone,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.black,
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: 'PHONE',
                                    suffixIcon: Icon(Icons.call),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              Text(
                                'Country *',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Container(
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton<String>(
                                            value: _myCountry,
                                            iconSize: 30,
                                            icon: (null),
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16,
                                            ),
                                            hint: Text('Select Country'),
                                            onChanged: (String newValue) {
                                              setState(() {
                                                _myCountry = newValue;
                                                _myCity = null;
                                                _getAllCities(_myCountry);
                                                print(_myCountry);
                                              });
                                            },
                                            items: _allCountriesModel.data
                                                    ?.map((item) {
                                                  return new DropdownMenuItem(
                                                    child: new Text(item.name),
                                                    value: item.id.toString(),
                                                  );
                                                })?.toList() ??
                                                [],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              Text(
                                'City *',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              _allCitiesModel.data != null
                                  ? Container(
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: DropdownButtonHideUnderline(
                                              child: ButtonTheme(
                                                alignedDropdown: true,
                                                child: DropdownButton<String>(
                                                  value: _myCity,
                                                  iconSize: 30,
                                                  icon: (null),
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                  ),
                                                  hint: Text('Select City'),
                                                  onChanged: (String newValue) {
                                                    setState(() {
                                                      _myCity = newValue;

                                                      print(_myCity);
                                                    });
                                                  },
                                                  items: _allCitiesModel
                                                          .data.cities
                                                          ?.map((item) {
                                                        return new DropdownMenuItem(
                                                          child: new Text(
                                                              item.name),
                                                          value: item.id
                                                              .toString(),
                                                        );
                                                      })?.toList() ??
                                                      [],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Center(
                                      child: Text('NO Cities, SELECT COUNTRY'),
                                    ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              Text(
                                'Password *',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
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
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'PASSWORD IS INVALID';
                                    }
                                    return null;
                                  },
                                  onChanged: (valeu) {
                                    setState(() {
                                      _password = valeu;
                                    });
                                  },
                                  keyboardType: TextInputType.phone,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.black,
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: '*****',
                                    suffixIcon: Icon(Icons.visibility),
                                  ),
                                  obscureText: true,
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              Text(
                                'Confirm password *',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
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
                                  validator: (vale) {
                                    if (vale.isEmpty) {
                                      return 'CONFIRM PASSWORD IS INVALID';
                                    }
                                    return null;
                                  },
                                  onChanged: (valeu) {
                                    setState(() {
                                      _confPassword = valeu;
                                    });
                                  },
                                  keyboardType: TextInputType.phone,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.black,
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: '*****',
                                    suffixIcon: Icon(Icons.visibility),
                                  ),
                                  obscureText: true,
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Center(
                                child: Text(
                                  message,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).errorColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              _lo
                                  ? Reusable.showLoader(_lo,
                                      width: getProportionateScreenHeight(50),
                                      height: getProportionateScreenHeight(50))
                                  : Button(
                                      textButton: 'Create an account',
                                      onPressed: () {
                                        print(
                                            '==========================REG INFO ================= ');
                                        print(_name);
                                        print(_email);
                                        print(_myCountry);
                                        print(_myCity);
                                        print(_password);
                                        print(_confPassword);
                                        print(
                                            '==========================DONE================= ');
                                        if (_password == _confPassword) {
                                          _submitForm();
                                        } else {
                                          print('ERROR');
                                        }
                                      },
                                    )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              ),
      ),
    )));
  }
}
