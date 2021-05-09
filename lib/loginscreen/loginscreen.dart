import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/appBar/appbar_widget.dart';
import 'package:lotleads/bottomBar/bottombar_widget.dart';
import 'package:lotleads/core/app_colors.dart';
import 'package:lotleads/core/app_text_styles.dart';
import 'package:lotleads/loginscreen/anotherproblem.dart';
import 'package:lotleads/loginscreen/passwordscreen.dart';
import 'package:lotleads/loginscreen/widgets/loginbox_widget.dart';
import 'package:ndialog/ndialog.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  var functionlogin;
  LoginScreen({required this.functionlogin});

  @override
  _LoginScreenState createState() =>
      _LoginScreenState(funclogin: functionlogin);
}

class _LoginScreenState extends State<LoginScreen> {
  var pageController = PageController(initialPage: 1);
  var funclogin;

  _LoginScreenState({required this.funclogin});

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
            PasswordRecoverScreen(returnhome: returnHome),
            LoginBox(flogin: funclogin),
            AnotherProblemWidget(
              returnhome: returnHome,
              returnhomedialog: returnhomedialog,
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

  returnhomedialog() {
    pageController.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    NDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      title: Text(
        "Problema Reportado",
        style: AppTextStyles.heading15,
      ),
      content: Text(
        "Agradecemos o contato e sentimos muito pelo ocorrido, o problema será investigado.",
        style: AppTextStyles.heading,
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: AnimatedButton(
              width: 150,
              height: 50,
              color: AppColors.borderLogin,
              child: Text(
                'Ok',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: dialogDismiss,
            ),
          ),
        )
      ],
    ).show(context);
  }

  dialogDismiss() {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  passwordrecover() {
    pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}
