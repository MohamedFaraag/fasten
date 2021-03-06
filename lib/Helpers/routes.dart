import 'package:flutter/material.dart';

import '../Screens/Boob.dart';
import '../Screens/SelectContactWith.dart';
import '../Screens/EditProFiel.dart';
import '../Screens/favorite.dart';
import '../Screens/AdTybeScreen.dart';
import '../Screens/SingleProduct.dart';
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
import '../Screens/ShowMoreForLatestAds.dart';
import '../Screens/SHowMoreForFeatureAds.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
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
  SingleProduct.routeName: (context) => SingleProduct(),
  AdTybeScreen.routeName: (context) => AdTybeScreen(),
  Favorite.routeName: (context) => Favorite(),
  EditProFile.routeName: (context) => EditProFile(),
  SelectContactWith.routeName: (context) => SelectContactWith(),
  Boob.routeName: (context) => Boob(),
  EditAds.routeName: (context) => EditAds(),
  ShowMoreForLatestAds.routeName: (context) => ShowMoreForLatestAds(),
  SHowMoreForFeatureAds.routeName: (context) => SHowMoreForFeatureAds(),
};
