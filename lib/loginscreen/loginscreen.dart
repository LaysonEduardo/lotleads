import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lotleads/appBar/appbar_widget.dart';
import 'package:lotleads/bottomBar/bottombar_widget.dart';
import 'package:lotleads/core/app_colors.dart';
import 'package:lotleads/core/app_text_styles.dart';
import 'package:lotleads/loginscreen/passwordscreen.dart';
import 'package:lotleads/loginscreen/widgets/loginbox_widget.dart';
import 'package:ndialog/ndialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

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
          ],
        ),
        bottomNavigationBar: BottomBarWidget(
          functionHelper: helper,
          passwordrecover: passwordrecover,
        ),
        floatingActionButton: Container(
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: helpdialog,
            child: Ink(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: AppColors.borderLogin,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.help,
                color: AppColors.white,
              ),
            ),
          ),
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

  helpdialog() {
    NDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Text.rich(
              TextSpan(
                  text: "Sobre o ",
                  style: AppTextStyles.heading,
                  children: [
                    TextSpan(
                      text: 'LotLeads',
                      style: AppTextStyles.title3,
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: dialogDismiss, // needed
              child: Ink(
                decoration: BoxDecoration(
                  color: AppColors.borderLogin,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                height: 40,
                width: 40,
                child: Icon(
                  LineIcons.times,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: "O Aplicativo: ",
                    style: AppTextStyles.heading15,
                    children: [
                      TextSpan(
                          text:
                              'LotLeads tem o prop??sito de fazer com que o gerenciamento de cadastros capturados de redes sociais e semelhantes seja mais pr??tico.',
                          style: AppTextStyles.heading),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: "Quem pode utilizar :",
                    style: AppTextStyles.heading15,
                    children: [
                      TextSpan(
                          text:
                              ' Inicialmente o Lotleads esta limitado e em fase de testes. \nCaso queira fazer parte ?? s?? entrar em contato com nosso suporte.',
                          style: AppTextStyles.heading),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: "Contato:",
                    style: AppTextStyles.heading15,
                    children: [
                      TextSpan(
                        text:
                            ' Deseja entrar em contato com nosso suporte? ?? s?? escolher um dos m??todos abaixo.',
                        style: AppTextStyles.heading,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: launchEmail, // needed
                child: Ink(
                  decoration: BoxDecoration(
                    color: AppColors.darkRed,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 40,
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LineIcons.envelope,
                        color: AppColors.white,
                      ),
                      Text(
                        'Email',
                        style: AppTextStyles.bodylightGrey,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: launchWhatsApp,
                child: Ink(
                    decoration: BoxDecoration(
                      color: AppColors.darkGreen,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 40,
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          LineIcons.whatSApp,
                          color: AppColors.white,
                        ),
                        Text(
                          'Whatsapp',
                          style: AppTextStyles.bodylightGrey,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    ).show(context);
  }

  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+5514936180216',
      text: "Ol?? Layson, tudo bom?",
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    await launch('$link');
  }

  launchGithub() async {
    const url = 'https://github.com/LaysonEduardo/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      FlutterWebBrowser.openWebPage(url: "https://github.com/LaysonEduardo/");
    }
  }

  launchEmail() async {
    const url = 'mailto:contato@layson.dev.br';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      FlutterWebBrowser.openWebPage(url: "mailto:contato@layson.dev.br");
    }
  }
}
