import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lotleads/core/app_colors.dart';
import 'package:lotleads/loggedScreen/configuracoes/settingScreen.dart';
import 'package:lotleads/loggedScreen/historico/historicScreen.dart';
import 'package:lotleads/loggedScreen/leads/leadsScreen.dart';
import 'package:lotleads/loggedScreen/perfil/profileScreen.dart';
import 'package:lotleads/loggedScreen/widgets/appBarLogged_widget.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// ignore: must_be_immutable
class LoggedScreen extends StatefulWidget {
  LoggedScreen();
  @override
  _LoggedScreenState createState() => _LoggedScreenState();
}

class _LoggedScreenState extends State<LoggedScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var pageController = PageController(initialPage: 0);
  var _currentIndex = 0;
  FirebaseAuth user = FirebaseAuth.instance;
  var displayname;
  var displaysubtitle;

  @override
  Widget build(BuildContext context) {
    if (user.currentUser!.displayName == null ||
        user.currentUser!.displayName == '') {
      displayname = 'Usuário';
      displaysubtitle = 'Por favor, atualize seus dados no página perfil';
    } else {
      displayname = user.currentUser!.displayName;
      displaysubtitle =
          'Capture suas Leads e entre em teste com eles agora mesmo.';
      print(user.currentUser!.displayName);
    }
    return Scaffold(
      appBar: AppbarLoggedWidget(
        subtitle: displaysubtitle,
        username: displayname,
      ),
      backgroundColor: Colors.grey[300],
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          LeadsScreen(),
          HistoricScreen(),
          ProfileScreen(),
          SettingScreen()
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.borderLogin,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() {
            _currentIndex = i;
            pageController.animateToPage(_currentIndex,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          }),
          items: [
            SalomonBottomBarItem(
                icon: Icon(Icons.contacts_rounded),
                title: Text("Leads"),
                selectedColor: Colors.white,
                unselectedColor: Colors.teal[700]),
            SalomonBottomBarItem(
                icon: Icon(Icons.history),
                title: Text("Histórico"),
                selectedColor: Colors.white,
                unselectedColor: Colors.teal[700]),
            SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Perfil"),
                selectedColor: Colors.white,
                unselectedColor: Colors.teal[700]),
            SalomonBottomBarItem(
                icon: Icon(Icons.settings),
                title: Text("Configurações"),
                selectedColor: Colors.white,
                unselectedColor: Colors.teal[700]),
          ],
        ),
      ),
    );
  }
}
