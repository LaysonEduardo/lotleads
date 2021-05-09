import 'package:flutter/material.dart';
import 'package:lotleads/loggedScreen/loggedScreen.dart';
import 'package:lotleads/loginscreen/loginscreen.dart';

// ignore: must_be_immutable
class AppWidget extends StatelessWidget {
  var pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "LotLeads",
        home: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            LoginScreen(
              functionlogin: firebaselogin,
            ),
            LoggedScreen(
              funclogout: firebaselogout,
            )
          ],
        ));
  }

  firebaselogin() async {
    pageController.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  firebaselogout() {
    pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}
