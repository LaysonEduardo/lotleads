import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/loggedScreen/loggedScreen.dart';
import 'package:lotleads/loginscreen/loginscreen.dart';

// ignore: must_be_immutable
class AppWidget extends StatelessWidget {
  var pageController = PageController(initialPage: 0);
  FirebaseAuth status = FirebaseAuth.instance;
  var page;

  @override
  Widget build(BuildContext context) {
    if (status.currentUser == null) {
      page = LoginScreen();
    } else {
      page = LoggedScreen();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LotLeads",
      home: page,
    );
  }
}

//LoginScreen());
