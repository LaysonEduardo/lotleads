import 'package:flutter/material.dart';
import 'package:lotleads/loginscreen/loginscreen.dart';

// ignore: must_be_immutable
class AppWidget extends StatelessWidget {
  var pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "LotLeads",
        home: LoginScreen());
  }
}
