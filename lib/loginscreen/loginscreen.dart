import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/appBar/appbar_widget.dart';
import 'package:lotleads/bottomBar/bottombar_widget.dart';
import 'package:lotleads/loginscreen/anotherproblem.dart';
import 'package:lotleads/loginscreen/passwordscreen.dart';
import 'package:lotleads/loginscreen/widgets/loginbox_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppbarWidget(),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            PasswordRecoverScreen(
              returnhome: returnHome,
            ),
            LoginBox(),
            AnotherProblemWidget(
              returnhome: returnHome,
            ),
          ],
        ),
        bottomNavigationBar: BottomBarWidget(
          functionHelper: helper,
          passwordrecover: passwordrecover,
        ),
      ),
    ]);
  }

  helper() {
    pageController.animateToPage(2,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  returnHome() {
    pageController.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  dialogDismiss() {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  passwordrecover() {
    pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}
