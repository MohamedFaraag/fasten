import 'package:flutter/material.dart';

import '../Screens/Boob.dart';
import '../Screens/SelectContactWith.dart';
import '../Screens/EditProFiel.dart';
import '../Screens/favorite.dart';
import '../Screens/ProductForSell.dart';
import '../Screens/details.dart';
import '../Screens/myAdds.dart';
import '../Screens/NavgatorForSettings/lang.dart';
import '../Screens/Settings.dart';
import '../Screens/signoutConfirm.dart';
import '../Screens/add_Adds.dart';
import '../Screens/ForgetPassword.dart';
import '../Screens/Profile.dart';
import '../Screens/Home.dart';
import '../Screens/Finish.dart';
import '../Screens/Regiester.dart';
import '../Screens/SingUp.dart';
import '../Screens/Login.dart';
import '../Screens/Welcome.dart';
import '../Screens/EditAds.dart';
import '../Screens/SplashScreen.dart';

final Map<String, WidgetBuilder> routes = {
  SplScreen.routeName:(context)=>SplScreen(),
  Welcome.routeName: (context) => Welcome(),
  Login.routeName: (context) => Login(),
  SingUp.routeName: (context) => SingUp(),
  Regeister.routeName: (context) => Regeister(),
  Finish.routeName: (context) => Finish(),
  Home.routeName: (context) => Home(),
  ProFile.routeName: (context) => ProFile(),
  ForgetPassword.routeName: (context) => ForgetPassword(),
  AddAdds.routeName: (context) => AddAdds(),
  SingoutConfirm.routeName: (context) => SingoutConfirm(),
  Settings.routeName: (context) => Settings(),
  Language.routeName: (context) => Language(),
  MyAdds.routeName: (context) => MyAdds(),
  Detials.routeName: (context) => Detials(),
  ProductForSell.routeName: (context) => ProductForSell(),
  Favorite.routeName: (context) => Favorite(),
  EditProFile.routeName: (context) => EditProFile(),
  SelectContactWith.routeName: (context) => SelectContactWith(),
  Boob.routeName: (context) => Boob(),
  EditAds.routeName: (context) => EditAds(),
};
