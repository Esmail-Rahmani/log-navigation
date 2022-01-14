
import 'package:assinment/ui/Login.dart';
import 'package:assinment/ui/SignUp.dart';
import 'package:assinment/ui/TabsScreen.dart';
import 'package:assinment/ui/Test.dart';
import 'package:flutter/material.dart';

import 'ui/CheckLocationEnabled.dart';
import 'ui/ForgotPassword.dart';

Map<String, Widget Function(BuildContext)> routes = {


  'loginScreen': (context) => LoginPage(),
  'locationEnabled': (context) => CheckLocationEnabled(),
  'signUp': (context) => const SignUpPage(),
  'test': (context) => const Test(),
  'forgotPassword': (context) => const ForgotPassword(),
  'tabScreen': (context) => const TabsScreen(),

};

class Routes {
 static String loginPage = "loginScreen";
 static String test = 'test';
  static String forgotPassword = "forgotPassword";
  static String signUp = "signUp";
  static String locationEnabled = "locationEnabled";
  static String tabScreen = "tabScreen";

}
